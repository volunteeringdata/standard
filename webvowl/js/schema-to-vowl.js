/*
 * Converts the Volunteering Data ontology, as Turtle from https://api.volunteeringdata.io/schema,
 * into the VOWL JSON format that WebVOWL reads (normally produced by the Java OWL2VOWL converter).
 *
 * Only the OWL features the ontology uses are covered: classes, subclasses, object and datatype
 * properties with their domains, ranges, subproperties and inverses, labels and comments.
 * Anything used as a domain or range is drawn as a class, including SKOS concepts such as :Cause.
 *
 * Needs N3.js (https://github.com/rdfjs/N3.js) as the global N3 in a browser, or from require in Node.
 */
(function (root, factory) {
  if (typeof module === "object" && module.exports) {
    module.exports = factory(require("n3"));
  } else {
    root.schemaToVowl = factory(root.N3);
  }
})(this, function (N3) {
  "use strict";

  var RDF = "http://www.w3.org/1999/02/22-rdf-syntax-ns#";
  var RDFS = "http://www.w3.org/2000/01/rdf-schema#";
  var OWL = "http://www.w3.org/2002/07/owl#";
  var XSD = "http://www.w3.org/2001/XMLSchema#";
  var SKOS = "http://www.w3.org/2004/02/skos/core#";
  var DC = "http://purl.org/dc/terms/";

  function localName(iri) {
    var match = /[^#\/]*$/.exec(iri);
    return match && match[0] ? match[0] : iri;
  }

  function baseIri(iri) {
    return iri.replace(/[#\/][^#\/]*$/, "");
  }

  return function schemaToVowl(turtle) {
    var prefixes = {};
    var store = new N3.Store(new N3.Parser().parse(turtle, null, function (prefix, iri) {
      prefixes[prefix] = iri.value;
    }));

    var ontology = store.getSubjects(RDF + "type", OWL + "Ontology", null)[0];
    var ontologyIri = ontology ? ontology.value : "";

    function objects(subject, predicate) {
      return store.getObjects(subject, predicate, null);
    }

    function iris(subject, predicate) {
      return objects(subject, predicate)
        .filter(function (term) { return term.termType === "NamedNode"; })
        .map(function (term) { return term.value; });
    }

    // { "en": "…" } from language-tagged literals; untagged ones go under "undefined".
    function literalsByLanguage(subject, predicates) {
      var result = {};
      predicates.forEach(function (predicate) {
        objects(subject, predicate).forEach(function (term) {
          var language = term.language || "undefined";
          if (term.termType === "Literal" && !(language in result)) {
            result[language] = term.value;
          }
        });
      });
      return result;
    }

    function firstLiteral(subject, predicate) {
      var term = objects(subject, predicate).filter(function (t) { return t.termType === "Literal"; })[0];
      return term ? term.value : undefined;
    }

    function isInOntology(iri) {
      return ontologyIri !== "" && iri.indexOf(ontologyIri) === 0;
    }

    // Prefer a range or domain in the ontology's own namespace when several are given.
    function pickOne(values) {
      return values.filter(isInOntology)[0] || values[0];
    }

    var nextId = 0;
    var classes = [];
    var classAttributes = [];
    var properties = [];
    var propertyAttributes = [];
    var classIds = {};
    var thingIds = {};

    function addClass(type, attributes) {
      var id = String(nextId++);
      attributes.id = id;
      classes.push({ id: id, type: type });
      classAttributes.push(attributes);
      return id;
    }

    function addProperty(type, attributes) {
      var id = String(nextId++);
      attributes.id = id;
      properties.push({ id: id, type: type });
      propertyAttributes.push(attributes);
      return id;
    }

    function classId(iri) {
      if (classIds[iri]) return classIds[iri];
      var node = N3.DataFactory.namedNode(iri);
      var label = literalsByLanguage(node, [RDFS + "label", SKOS + "prefLabel"]);
      label["IRI-based"] = localName(iri);
      var attributes = {
        iri: iri,
        baseIri: baseIri(iri),
        label: label,
        comment: literalsByLanguage(node, [RDFS + "comment", SKOS + "definition"]),
        instances: 0
      };
      if (!isInOntology(iri)) attributes.attributes = ["external"];
      classIds[iri] = addClass("owl:Class", attributes);
      return classIds[iri];
    }

    // Properties without a domain or range are drawn to owl:Thing, shared per other end.
    function thingId(key) {
      if (!thingIds[key]) {
        thingIds[key] = addClass("owl:Thing", {
          iri: OWL + "Thing",
          baseIri: "http://owl2vowl.de",
          label: { "undefined": "Thing" }
        });
      }
      return thingIds[key];
    }

    // Each datatype property gets its own literal or datatype node, as OWL2VOWL does.
    function datatypeId(iri) {
      if (!iri || iri === RDFS + "Literal") {
        return addClass("rdfs:Literal", {
          iri: RDFS + "Literal",
          label: { "IRI-based": "Literal", "undefined": "Literal" }
        });
      }
      return addClass("rdfs:Datatype", {
        iri: iri,
        baseIri: baseIri(iri),
        label: { "IRI-based": localName(iri) }
      });
    }

    // Declared classes first, then everything used as a domain or range.
    store.getSubjects(RDF + "type", OWL + "Class", null).forEach(function (term) {
      if (term.termType === "NamedNode") classId(term.value);
    });

    store.getQuads(null, RDFS + "subClassOf", null, null).forEach(function (quad) {
      if (quad.subject.termType !== "NamedNode" || quad.object.termType !== "NamedNode") return;
      var sub = classId(quad.subject.value);
      var sup = classId(quad.object.value);
      addProperty("rdfs:SubClassOf", { domain: sub, range: sup, attributes: ["object", "anonymous"] });
      var subAttributes = classAttributes[classes.findIndex(function (c) { return c.id === sub; })];
      var supAttributes = classAttributes[classes.findIndex(function (c) { return c.id === sup; })];
      (subAttributes.superClasses = subAttributes.superClasses || []).push(sup);
      (supAttributes.subClasses = supAttributes.subClasses || []).push(sub);
    });

    var propertyIds = {};
    var propertyAttributesByIri = {};

    [["owl:objectProperty", OWL + "ObjectProperty", "object"],
     ["owl:datatypeProperty", OWL + "DatatypeProperty", "datatype"]].forEach(function (kind) {
      store.getSubjects(RDF + "type", kind[1], null).forEach(function (term) {
        if (term.termType !== "NamedNode") return;
        var iri = term.value;
        var isObject = kind[2] === "object";
        var domainIri = pickOne(iris(term, RDFS + "domain"));
        var rangeIri = pickOne(iris(term, RDFS + "range"));
        var domain = domainIri ? classId(domainIri) : null;
        var range;
        if (!isObject) {
          range = datatypeId(rangeIri);
        } else if (rangeIri) {
          range = classId(rangeIri);
        } else {
          range = thingId("range of " + (domainIri || "any"));
        }
        if (!domain) domain = thingId("domain of " + (isObject ? (rangeIri || "any") : "literals"));

        var label = literalsByLanguage(term, [RDFS + "label", SKOS + "prefLabel"]);
        label["IRI-based"] = localName(iri);
        var attributes = {
          iri: iri,
          baseIri: baseIri(iri),
          label: label,
          comment: literalsByLanguage(term, [RDFS + "comment", SKOS + "definition"]),
          domain: domain,
          range: range,
          attributes: [kind[2]].concat(isInOntology(iri) ? [] : ["external"])
        };
        propertyIds[iri] = addProperty(kind[0], attributes);
        propertyAttributesByIri[iri] = attributes;
      });
    });

    // Subproperties and inverses, between properties that are both drawn.
    Object.keys(propertyIds).forEach(function (iri) {
      var node = N3.DataFactory.namedNode(iri);
      var attributes = propertyAttributesByIri[iri];
      iris(node, RDFS + "subPropertyOf").forEach(function (superIri) {
        if (!propertyIds[superIri]) return;
        (attributes.superproperty = attributes.superproperty || []).push(propertyIds[superIri]);
        var superAttributes = propertyAttributesByIri[superIri];
        (superAttributes.subproperty = superAttributes.subproperty || []).push(propertyIds[iri]);
      });
      iris(node, OWL + "inverseOf").forEach(function (inverseIri) {
        if (!propertyIds[inverseIri]) return;
        attributes.inverse = propertyIds[inverseIri];
        propertyAttributesByIri[inverseIri].inverse = propertyIds[iri];
      });
    });

    var header = {
      languages: ["en", "undefined"],
      baseIris: Object.keys(classAttributes.concat(propertyAttributes).reduce(function (all, attributes) {
        if (attributes.baseIri && attributes.baseIri !== "http://owl2vowl.de") all[attributes.baseIri] = true;
        return all;
      }, {})),
      prefixList: prefixes,
      iri: ontologyIri
    };
    if (ontology) {
      header.title = literalsByLanguage(ontology, [DC + "title", RDFS + "label"]);
      header.description = literalsByLanguage(ontology, [DC + "description", RDFS + "comment"]);
      header.version = firstLiteral(ontology, OWL + "versionInfo");
      header.author = objects(ontology, DC + "creator").concat(objects(ontology, DC + "contributor"))
        .map(function (term) { return term.value; });
    }

    return {
      _comment: "Generated in the browser from " + (ontologyIri || "the schema") + " by schema-to-vowl.js",
      header: header,
      namespace: [],
      "class": classes,
      classAttribute: classAttributes,
      property: properties,
      propertyAttribute: propertyAttributes
    };
  };
});
