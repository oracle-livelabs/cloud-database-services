# Lab 2: Connect Your Microsoft Foundry Agent to Oracle AI Database@Azure Using MCP

## Introduction

In this lab, you will connect the managed Oracle MCP Server configured in Lab 1 to an **existing agent in Microsoft Foundry**, enabling the agent to access approved capabilities and live data in **Oracle AI Database@Azure**.

This lab focuses specifically on integrating Oracle MCP with an existing Microsoft Foundry agent. Creating, deploying, or configuring the Microsoft Foundry agent itself is outside the scope of this workshop. Before beginning, make sure you have access to a Foundry project with an agent that is already created and ready to use.

You will register the Oracle MCP Server as a tool in your Foundry project, configure the required OAuth connection, make the Oracle MCP capabilities available to the existing agent, and test access to live Oracle Database information.

The Oracle MCP Server provides the managed interface between the agent and Oracle AI Database@Azure. The agent does not require a direct database connection; it invokes only the database capabilities exposed and authorized through the MCP Server.

**Estimated time:** 30 minutes.

### Objectives

Starting with an existing Microsoft Foundry agent, you will connect the managed Oracle MCP Server configured in Lab 1 and make its approved Oracle Database capabilities available to the agent.

In this lab, you will:

- Connect the managed Oracle MCP Server configured in Lab 1 to an existing Microsoft Foundry agent.
- Configure the OAuth connection required to access the remote Oracle MCP Server.
- Make the connected Oracle MCP tool available to an existing Microsoft Foundry agent.
- Verify that the agent can discover and invoke approved Oracle MCP capabilities.
- Test natural-language requests that retrieve live information from Oracle AI Database@Azure.

### Prerequisites

Before starting this lab, verify that you have:

- Access to the Microsoft Azure environment provided for the workshop.
- Access to the Microsoft Foundry project provided for the workshop.
- An **existing Microsoft Foundry agent** that is already created and available in the project. Agent creation and configuration are outside the scope of this lab.
- The Oracle MCP Server configured in **Lab 1: Create and Configure the MCP Server for Oracle AI Database@Azure**.
- The MCP Server OCID.
- The MCP client registration details created in Lab 1.
- The OAuth connection information required by the workshop, including the client ID, client secret, authorization URL, token URL, refresh URL if applicable, and scopes.

> **Important:** This lab begins with an existing Microsoft Foundry agent. The workshop does not cover how to create, deploy, or configure an agent in Microsoft Foundry. If you are using the workshop-provided environment, use the existing agent identified by your instructor.

> **Important:** Do not include client secrets, access tokens, or other confidential credentials in screenshots, prompts, documentation, or other shared content.



## Task 1: Connect the Oracle MCP Server to Your Microsoft Foundry Agent

You will start with the existing Microsoft Foundry agent identified in the prerequisites. No agent creation is required in this lab.

In this task, you will register the managed Oracle MCP Server configured in Lab 1 as a tool in your Microsoft Foundry project and make that tool available to the existing agent.

### Register the Oracle MCP Tool

1. Sign in to the **Microsoft Azure portal**.

2. Open the **Microsoft Foundry** resource provided for the workshop.

3. Open the Foundry project that contains the agent you will use for this lab.

4. In the project navigation, select **Build**.

5. Select **Tools**.

6. On the **Tools** page, select **Connect a tool**.

7. Select **Oracle**.

> **Note:** The Oracle tool represents the remote Oracle Database Tools MCP Server created and configured in OCI in Lab 1.

8. In the **Connect the Oracle tool** dialog, enter the MCP Server and authentication information from Lab 1.

Configure the following fields:

- **OCID:** Enter the OCID of the MCP Server created in Lab 1.
- **Authentication:** Select **OAuth Identity Passthrough**.
- **OAuth Provider:** Select the option required by the workshop. For the demonstrated configuration, select **Custom**.
- **Client ID:** Enter the client ID from the MCP client registration created in Lab 1.
- **Client secret:** Enter the client secret from the MCP client registration.
- **Token URL:** Enter the OAuth token endpoint for the OCI IAM Identity Domain.
- **Auth URL:** Enter the OAuth authorization endpoint for the OCI IAM Identity Domain.
- **Refresh URL:** Enter the refresh-token endpoint if required by the client configuration.
- **Scopes:** Enter the scope required to access the MCP Server.

> **Important:** Use the values provided by the workshop environment. Do not copy real client secrets, tokens, or other confidential values into this guide.

9. Review the MCP Server and OAuth settings.

10. Select **Connect**.

11. Wait for the Oracle tool connection to complete.

12. Verify that the **Oracle** tool appears in the project's **Tools** list.

### Review the Connected Oracle Tool

13. Open the connected **Oracle** tool.

14. Review the tool details.

Depending on the Foundry interface, the connection details can include:

- Remote MCP server endpoint.
- Redirect URL.
- Authentication method.
- Project connection ID.
- Agents using the tool.

> **Note:** These values are specific to your environment. Do not expose confidential authentication values in screenshots or workshop documentation.

15. Verify that the connection represents the Oracle MCP Server configured in Lab 1.

16. Review the MCP capabilities made available through the connection.

The available capabilities are controlled by the **MCP toolset** and authorization configuration created in Lab 1.

### Add the Oracle Tool to Your Existing Agent

17. Navigate to **Agents** in the Foundry project.

18. Open the existing agent provided for this workshop.

19. Open the agent's **Tools** configuration.

20. Add the connected **Oracle** tool to the agent.

21. Save the agent configuration.

22. Verify that the Oracle tool is available to the agent.

The agent is now connected to Oracle AI Database@Azure through the managed Oracle MCP Server.

```text
Microsoft Foundry Agent
        |
        | Oracle MCP Tool
        v
OCI Database Tools MCP Server
        |
        | Database Tools Connection
        v
Oracle AI Database@Azure
```

> **Important:** The Microsoft Foundry agent does not connect directly to Oracle AI Database@Azure. The managed Oracle MCP Server provides the database access layer and exposes only the capabilities permitted by its MCP toolsets, application roles, IAM policies, and underlying database privileges.



## Task 2: Test the AI Agent

In this task, you will test the agent and verify that it can use the Oracle MCP tool to retrieve live database information.

### Open the Agent Playground

1. Open the existing agent provided for this workshop.

2. Open the agent's test or playground interface.

3. Verify that the **Oracle** tool is available to the agent.

### Ask the Agent About the Oracle Database

4. Enter a natural-language request that requires information from Oracle AI Database@Azure.

For example:

```text
<copy>What database information can you retrieve using the Oracle tools?</copy>
```

5. Submit the request.

6. Observe the agent execution.

7. Verify that the agent recognizes when the Oracle MCP tool is required.

8. Review the tool invocation and response.

### Run a Database Query Through MCP

9. Enter a question that requires data from the sample Oracle AI Database@Azure environment.

Use a question appropriate for the schema and sample data provided by the workshop.

For example:

```text
<copy>List the tables available in the database and describe what information they contain.</copy>
```

10. Submit the request.

11. Verify that the agent invokes an Oracle MCP tool.

12. Review the response returned by the tool.

13. Verify that the agent uses the returned database information in its final response.

> **Note:** The exact response depends on the data and database objects available in the workshop environment.

### Verify the Integration

14. Confirm that the agent can use the Oracle MCP tool without a direct database connection configured in the agent.

15. Confirm that the Oracle MCP Server remains the access layer between Microsoft Foundry and Oracle AI Database@Azure.

The integration is complete:

```text
User
  |
  v
Microsoft Foundry Agent
  |
  v
Oracle MCP Tool
  |
  v
OCI Database Tools MCP Server
  |
  v
Oracle AI Database@Azure
```

## Summary

In this lab, you:

- Used an existing agent in Microsoft Foundry.
- Connected the managed Oracle MCP Server as an Oracle tool in Microsoft Foundry.
- Configured OAuth Identity Passthrough using the MCP client registration from Lab 1.
- Added the Oracle tool to the agent.
- Tested the agent with natural-language requests.
- Verified that the agent can use MCP tools to retrieve live information from Oracle AI Database@Azure.

The result is an existing Microsoft Foundry agent connected to a managed Oracle MCP Server that provides governed access to Oracle AI Database@Azure.

## Learn More

- [Database Tools MCP Server Overview](https://docs.oracle.com/en-us/iaas/database-tools/doc/mcp-servers.html)
- [Connecting to a Database Tools MCP Server](https://docs.oracle.com/en-us/iaas/database-tools/doc/connecting-mcp-server.html)

## Acknowledgements

**Authors**

* Leo Alvarado, Tammy Bednar, Product Management, Oracle Database Cloud Services, Multicloud

**Last Updated Date** - September, 2026
