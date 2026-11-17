---
permalink: /api
layout: default
title: Volunteering Data API
description: How to access volunteering data through the Volunteering Data API and its MCP server.
---

The Volunteering Data API gives access to volunteering opportunities, organisations and the data model. It is described by an [OpenAPI description document](https://api.volunteeringdata.io/openapi.json).

[Explore and try out the API endpoints](/api/swagger).


## MCP server

The API is also available as a [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) server, so that AI assistants and agents can query volunteering data directly. Each API endpoint is exposed as a read-only MCP tool with the same name.

MCP endpoint (Streamable HTTP): `https://api.volunteeringdata.io/mcp`

Add it to any MCP client that supports remote servers. For example, with [Claude Code](https://docs.claude.com/en/docs/claude-code/mcp):

```sh
claude mcp add --transport http volunteering https://api.volunteeringdata.io/mcp
```

See [AI-Ready Data](/ai-readiness) for more on how the data is made available to AI tools.
