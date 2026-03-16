---
permalink: /ontology/
layout: default
title: Volunteering and Social Action Ontology
breadcrumbs:
  - title: "Ontology"
---

<h2 id="introduction">Introduction</h2>


<p>The volunteering and social action ontology can be <a href="../webvowl/#opts=doc=0;filter_sco=true;mode_compact=true">visualized through WebVOWL</a>, a web-based ontology visualization tool.</p>

<p>The volunteering and social action ontology is implemented using RDF, a native data format for the semantic web. RDF enables the <a href="https://5stardata.info/en/">5-star</a> deployment scheme for Open Data; a scheme suggested by Tim Berners-Lee, the inventor of the Web and <a href="https://www.w3.org/DesignIssues/LinkedData.html">Linked Data</a> initiator.</p>


<h3 id="data-model">Data Model</h3>

<p>The following diagram illustrates the main elements of the Volunteering and Social Action Ontology.</p>

<img src="../assets/img/volunteering-data-model.svg" alt="Volunteering Data Model" title="Volunteering Data Model" />


<h2 id="organisation">Organisation</h2>

<h3 id="organisation-properties">Properties</h3>

<dl>
  <dt id="organisation-name">name</dt>
  <dd>The organisation's name.</dd>
  <dt id="organisation-description">description</dt>
  <dd>A description of the organisation.</dd>
  <dt id="organisation-website">website</dt>
  <dd>The URL of the organisation's website.</dd>
  <dt id="organisation-charity-number">charityNumber</dt>
  <dd>The UK charity registration number. See also:
    <a href="https://register-of-charities.charitycommission.gov.uk/">Charity Commission for England and Wales</a>;
    <a href="https://www.oscr.org.uk/about-charities/search-the-register/">Office of the Scottish Charity Regulator (OSCR)</a>;
    <a href="https://www.charitycommissionni.org.uk/charity-search">The Charity Commission for Northern Ireland</a>.
  </dd>
  <dt id="organisation-image">image</dt>
  <dd>An image representing the organisation (e.g. logo or photo).</dd>
  <dt id="organisation-activity">activity</dt>
  <dd>A volunteering opportunity offered by the organisation.</dd>
  <dt id="organisation-cause">cause</dt>
  <dd>A charitable cause the organisation is involved with. See the <a href="./cause">Charitable Cause Taxonomy</a>.</dd>
</dl>


<h2 id="activity">Activity</h2>

<h3 id="activity-properties">Properties</h3>

<dl>
  <dt id="activity-title">title</dt>
  <dd>The activity's title.</dd>
  <dt id="activity-description">description</dt>
  <dd>A description of the activity.</dd>
  <dt id="activity-requires-emergency-participation">requiresEmergencyParticipation</dt>
  <dd>Whether the activity requires emergency participation (boolean).</dd>
  <dt id="activity-image">image</dt>
  <dd>An image representing the activity.</dd>
  <dt id="activity-organisation">organisation</dt>
  <dd>The organisation running the activity.</dd>
  <dt id="activity-role">role</dt>
  <dd>A volunteer role associated with the activity.</dd>
  <dt id="activity-session">session</dt>
  <dd>A session when the activity takes place.</dd>
</dl>


<h2 id="role">Role</h2>

<h3 id="role-properties">Properties</h3>

<dl>
  <dt id="role-title">title</dt>
  <dd>The role's title.</dd>
  <dt id="role-description">description</dt>
  <dd>A description of the role.</dd>
  <dt id="role-commitment">commitment</dt>
  <dd>The time commitment expected for the role.</dd>
  <dt id="role-apply-link">applyLink</dt>
  <dd>A link to apply for the role.</dd>
  <dt id="role-allows-remote-participation">allowsRemoteParticipation</dt>
  <dd>Whether the role allows remote participation (boolean).</dd>
  <dt id="role-minimum-age">minimumAge</dt>
  <dd>The minimum age requirement for the role.</dd>
  <dt id="role-maximum-age">maximumAge</dt>
  <dd>The maximum age requirement for the role.</dd>
  <dt id="role-activity">activity</dt>
  <dd>The activity this role is part of.</dd>
  <dt id="role-accessibility">accessibility</dt>
  <dd>Accessibility information for the role.</dd>
  <dt id="role-requirement">requirement</dt>
  <dd>A requirement for the role. See the <a href="./requirement">Requirement Taxonomy</a>.</dd>
  <dt id="role-reward">reward</dt>
  <dd>A reward associated with the role.</dd>
  <dt id="role-skill">skill</dt>
  <dd>A skill associated with the role. See the <a href="./skill">Skill Taxonomy</a>.</dd>
</dl>


<h2 id="session">Session</h2>

<h3 id="session-properties">Properties</h3>

<dl>
  <dt id="session-activity">activity</dt>
  <dd>The activity this session is for.</dd>
  <dt id="session-location">location</dt>
  <dd>The location where the session takes place.</dd>
  <dt id="session-time">time</dt>
  <dd>The time when the session occurs.</dd>
</dl>


<h2 id="location">Location</h2>

<h3 id="location-properties">Properties</h3>

<dl>
  <dt id="location-name">name</dt>
  <dd>A name for the location.</dd>
  <dt id="location-address">address</dt>
  <dd>The location's address as free text. This can be a partial (e.g. postcode) or full address.</dd>
  <dt id="location-geometry">geometry</dt>
  <dd>A generic geometry object to support interfaces common to all geographically referenced geometric objects. Sub-property of <a href="https://docs.ogc.org/is/22-047r1/22-047r1.html#_property_geohasgeometry">geosparql:hasGeometry</a>. See the <a href="https://docs.ogc.org/is/22-047r1/22-047r1.html">GeoSPARQL standard</a>.</dd>
  <dt id="location-latitude">latitude</dt>
  <dd>The location's latitude in decimal degree. Sub-property of <a href="http://www.w3.org/2003/01/geo/wgs84_pos#lat">geo:lat</a>. See <a href="https://www.w3.org/2003/01/geo/wgs84_pos">WGS84 Geo Positioning</a>.</dd>
  <dt id="location-longitude">longitude</dt>
  <dd>The location's longitude in decimal degree. Sub-property of <a href="http://www.w3.org/2003/01/geo/wgs84_pos#lat">geo:long</a>. See <a href="https://www.w3.org/2003/01/geo/wgs84_pos">WGS84 Geo Positioning</a>.</dd>
  <dt id="location-session">session</dt>
  <dd>A session that takes place at this location.</dd>
</dl>


<h2 id="time">Time</h2>

<h3 id="time-properties">Properties</h3>

<dl>
  <dt id="time-label">rdfs:label</dt>
  <dd>The temporal entity's name. See <a href="https://www.w3.org/TR/owl-time/#time:TemporalEntity">OWL Time Temporal Entity</a>.</dd>
  <dt id="time-beginning">time:hasBeginning</dt>
  <dd>The beginning of a period of time. See <a href="https://www.w3.org/TR/owl-time/#time:hasBeginning">OWL Time has beginning</a>.</dd>
  <dt id="time-end">time:hasEnd</dt>
  <dd>The end of a period of time. See <a href="https://www.w3.org/TR/owl-time/#time:hasEnd">OWL Time has end</a>.</dd>
</dl>

<h3 id="time-defined-temporal-entities">Defined temporal entities</h3>

<dl>
  <dt id="time-monday-morning">MondayMorning</dt>
  <dd>The time period between 6am and 12pm on Monday.</dd>
  <dt id="time-monday-afternoon">MondayAfternoon</dt>
  <dd>The time period between 12pm and 6pm on Monday.</dd>
  <dt id="time-monday-evening">MondayEvening</dt>
  <dd>The time period between 6pm and 12am on Monday.</dd>
  <dt id="time-tuesday-morning">TuesdayMorning</dt>
  <dd>The time period between 6am and 12pm on Tuesday.</dd>
  <dt id="time-tuesday-afternoon">TuesdayAfternoon</dt>
  <dd>The time period between 12pm and 6pm on Tuesday.</dd>
  <dt id="time-tuesday-evening">TuesdayEvening</dt>
  <dd>The time period between 6pm and 12am on Tuesday.</dd>
  <dt id="time-wednesday-morning">WednesdayMorning</dt>
  <dd>The time period between 6am and 12pm on Wednesday.</dd>
  <dt id="time-wednesday-afternoon">WednesdayAfternoon</dt>
  <dd>The time period between 12pm and 6pm on Wednesday.</dd>
  <dt id="time-wednesday-evening">WednesdayEvening</dt>
  <dd>The time period between 6pm and 12am on Wednesday.</dd>
  <dt id="time-thursday-morning">ThursdayMorning</dt>
  <dd>The time period between 6am and 12pm on Thursday.</dd>
  <dt id="time-thursday-afternoon">ThursdayAfternoon</dt>
  <dd>The time period between 12pm and 6pm on Thursday.</dd>
  <dt id="time-thursday-evening">ThursdayEvening</dt>
  <dd>The time period between 6pm and 12am on Thursday.</dd>
  <dt id="time-friday-morning">FridayMorning</dt>
  <dd>The time period between 6am and 12pm on Friday.</dd>
  <dt id="time-friday-afternoon">FridayAfternoon</dt>
  <dd>The time period between 12pm and 6pm on Friday.</dd>
  <dt id="time-friday-evening">FridayEvening</dt>
  <dd>The time period between 6pm and 12am on Friday.</dd>
  <dt id="time-saturday-morning">SaturdayMorning</dt>
  <dd>The time period between 6am and 12pm on Saturday.</dd>
  <dt id="time-saturday-afternoon">SaturdayAfternoon</dt>
  <dd>The time period between 12pm and 6pm on Saturday.</dd>
  <dt id="time-saturday-evening">SaturdayEvening</dt>
  <dd>The time period between 6pm and 12am on Saturday.</dd>
  <dt id="time-sunday-morning">SundayMorning</dt>
  <dd>The time period between 6am and 12pm on Sunday.</dd>
  <dt id="time-sunday-afternoon">SundayAfternoon</dt>
  <dd>The time period between 12pm and 6pm on Sunday.</dd>
  <dt id="time-sunday-evening">SundayEvening</dt>
  <dd>The time period between 6pm and 12am on Sunday.</dd>
</dl>


<h2 id="taxonomies">Taxonomies</h2>

<ul>
  <li><a href="./cause">Charitable Cause Taxonomy</a></li>
  <li><a href="./requirement">Requirement Taxonomy</a></li>
  <li><a href="./skill">Skill Taxonomy</a></li>
</ul>


<h2 id="contributing-knowledge">Contributing Knowledge to the Volunteering and Social Action Ontology</h2>

<p>We welcome domain experts and people with varied experiences of volunteering to contribute their knowledge of the sector. Shared knowledge is the basis to ensure our standard adequately provides structure to address the volunteering sector's needs.</p>

<h3 id="discussion-topics">Discussion Topics</h3>

<p>Please don't hesitate to contribute to the <a href="https://github.com/orgs/volunteeringdata/discussions/">discussions</a> on the volunteering data model repository.</p>

<p>We created 8 categories for focused discussions on specific modeling and requirements topics:</p>

<ul>
  <li><a href="https://github.com/orgs/volunteeringdata/discussions/categories/accessibility">Accessibility</a></li>
  <li><a href="https://github.com/orgs/volunteeringdata/discussions/categories/data-governance">Data Governance</a></li>
  <li><a href="https://github.com/orgs/volunteeringdata/discussions/categories/emergency-response">Emergency Response</a></li>
  <li><a href="https://github.com/orgs/volunteeringdata/discussions/categories/geographical-location">Geographical Location</a></li>
  <li><a href="https://github.com/orgs/volunteeringdata/discussions/categories/roles-and-skills">Roles and Skills</a></li>
  <li><a href="https://github.com/orgs/volunteeringdata/discussions/categories/value-typology">Value Mapping</a></li>
  <li><a href="https://github.com/orgs/volunteeringdata/discussions/categories/volunteer-involving-organisation">Volunteer Involving Organisation</a></li>
  <li><a href="https://github.com/orgs/volunteeringdata/discussions/categories/volunteering-opportunities">Volunteering Opportunities</a></li>
</ul>


<h2 id="standardisation-history">Standardisation History</h2>

<p>The data model's evolution is recorded as a <a href="../working-group/model-version/">series of versions</a>.</p>
