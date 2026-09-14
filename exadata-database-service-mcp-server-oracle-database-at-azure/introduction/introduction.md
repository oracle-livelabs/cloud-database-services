# Build an Enterprise AI Assistant with Microsoft Foundry, Oracle MCP, and Oracle AI Database@Azure

## Introduction
Enterprise AI applications increasingly need more than general-purpose language models. To deliver useful business outcomes, AI agents need secure access to trusted enterprise data and tools while preserving the identity, authorization, and governance controls organizations already
rely on.

In this workshop, you'll connect an AI agent in **Microsoft Foundry** to live enterprise data in **Oracle AI Database@Azure** using a managed **Model Context Protocol (MCP) Server**.

Oracle's managed MCP Server in OCI Database Tools provides a cloud-native interface for AI agents and assistants to access Oracle Database capabilities. It uses HTTPS, OCI identity, Database Tools
Connections, and governed MCP toolsets to control which database capabilities are available to connected AI applications. You'll first configure a managed MCP Server for your Oracle AI Database@Azure environment and define the database tools that the server makes available. You'll then register the MCP Server with Microsoft Foundry and make those Oracle Database capabilities available as tools to an AI agent.

The resulting architecture allows an Microsoft Foundry agent to use MCP to retrieve live information from Oracle AI Database@Azure without requiring you to deploy and operate your own MCP Server infrastructure.

By the end of this workshop, you'll understand how Oracle AI Database@Azure, Oracle MCP, and Microsoft Foundry work together to build enterprise AI assistants that can interact with governed Oracle data.

### **Oracle AI Database@Azure and Enterprise AI**

Oracle AI Database@Azure brings Oracle AI Database services into Microsoft Azure environments, enabling applications and AI services running in Azure to work with enterprise data stored in Oracle Database.

With a managed MCP Server, Oracle Database capabilities can be exposed to MCP-compatible AI applications through a standardized interface. MCP toolsets determine which capabilities an agent can discover and invoke, while Oracle Database and OCI identity controls continue to govern
access to the underlying data.

In this workshop, Microsoft Foundry provides the environment for building the AI agent, while the managed Oracle MCP Server provides the connection between the agent and Oracle AI Database@Azure.

The workshop follows this architecture:

``` text
Microsoft Foundry
       |
       | AI Agent
       v
Oracle MCP Tool
       |
       | MCP over HTTPS
       v
OCI Database Tools
Managed MCP Server
       |
       | Database Tools Connection
       v
Oracle AI Database@Azure
```

This approach separates the AI agent from the database access layer. The agent focuses on reasoning and deciding when to use a tool, while the managed MCP Server provides governed access to approved Oracle Database capabilities.


**Estimated Workshop Time:** 60 minutes.

### Objectives

After completing this workshop, you will be able to:

-   Understand how MCP connects AI agents to Oracle AI Database@Azure.
-   Configure an OCI Database Tools managed MCP Server for Oracle AI
    Database@Azure.
-   Configure MCP toolsets that expose approved Oracle Database
    capabilities.
-   Validate the MCP Server configuration and register an MCP client.
-   Configure the Oracle MCP Server as a tool for an Microsoft Foundry
    agent.
-   Build an Microsoft Foundry agent that uses Oracle MCP tools.
-   Use natural language to retrieve live information from Oracle AI
    Database@Azure.
-   Understand how Oracle MCP provides a managed and governed database
    access layer for enterprise AI agents.

### Prerequisites

To complete this workshop, you need:

-   Access to an **Oracle AI Database@Azure** environment.
-   Access to an **Oracle AI Database@Azure** database.
-   An **OCI Database Tools Connection** for the Oracle AI
    Database@Azure database.
-   Access to the **Microsoft Azure** environment.
-   Access to **Microsoft Foundry** and the AI model configured for the
    workshop.

You may now **proceed to the next lab**

## Acknowledgements

**Authors** 

* Leo Alvarado, Tammy Bednar, Product Management, Oracle Database Cloud Services, Multicloud 

**Last Updated Date** - August, 2026
