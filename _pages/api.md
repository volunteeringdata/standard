---
permalink: /api
layout: default
title: Volunteering Data API
description: How to access volunteering data through the Volunteering Data API and its MCP server.
---

The Volunteering Data API gives access to volunteering opportunities, organisations and the data model through a RESTful API, a SPARQL endpoint and an MCP server.

## RESTful API

[Explore and try out the API in Swagger UI](/swagger).

The RESTful API is built with [NamedQuery](https://github.com/theodi/NamedQuery). It is a collection of SPARQL queries, each given a name and published as an HTTP endpoint. Calling an endpoint runs its query against the [SPARQL endpoint](#sparql-endpoint), with any request parameters filled in, and returns the results. This means you can use the data without having to write SPARQL.

The response format can be chosen with the `Accept` header, for example `text/turtle` for [Turtle](https://www.w3.org/TR/turtle/).

API base URL: `https://api.volunteeringdata.io`

The API is described by an [OpenAPI description document](https://api.volunteeringdata.io/openapi.json).


## SPARQL endpoint

[Write and run SPARQL queries in the browser](/sparql).

The data is also available as a knowledge graph that can be queried with [SPARQL](https://www.w3.org/TR/sparql11-query/).

SPARQL endpoint: `https://sparql.volunteeringdata.io/sparql`


## MCP server

[Try the MCP demo to find activities by keyword or location](/mcp).

The API is also available as a [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) server, so that AI assistants and agents can query volunteering data directly. Each API endpoint is exposed as a read-only MCP tool with the same name.

MCP endpoint (Streamable HTTP): `https://api.volunteeringdata.io/mcp`

Add it to any MCP client that supports remote servers. For example, with [Claude Code](https://docs.claude.com/en/docs/claude-code/mcp):

```sh
claude mcp add --transport http volunteering https://api.volunteeringdata.io/mcp
```

See [AI-Ready Data](/ai-readiness) for more on how the data is made available to AI tools.
