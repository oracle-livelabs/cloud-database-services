# Lab 1: Configure MCP Server for Oracle AI Database

## Introduction

> ***IMPORTANT — Pre-configured Environment.*** The MCP servers used in this HOL are **preconfigured** and ready to use for this session. The configuration steps included in the following tasks are provided for instructional purposes only and will be discussed during the session. ***You do not need to perform these steps unless instructed.***

In this lab, you will configure an **OCI Database Tools Model Context Protocol (MCP) Server** to provide secure, governed access to Oracle AI Database.

The Database Tools MCP Server is a managed service that enables MCP-compatible AI applications and agents to interact with Oracle Database through a standard MCP interface. Rather than requiring an AI application to connect directly to the database, the MCP Server uses an existing **Database Tools Connection** and exposes approved database capabilities as MCP tools.

Access to the MCP Server is controlled through OCI IAM Identity Domains and OAuth 2.0. MCP toolsets determine which database operations are available to connected clients.

In later labs, you will use this MCP Server to enable AI agents running across different cloud environments to securely interact with Oracle AI Database.

**Estimated Time:** 15 minutes

### Objectives

In this lab, you will:

- Configure a managed MCP Server for Oracle AI Database using OCI Database Tools.
- Configure an MCP toolset that exposes database capabilities to MCP clients.
- Validate the MCP Server configuration.
- Register an MCP client that can be used by an AI agent in a later lab.
### Prerequisites

Before starting this lab, verify that the following resources are available:

- An Oracle AI Database accessible through OCI Database Tools.
- An existing **Database Tools Connection** for the Oracle AI Database.
- An OCI IAM Identity Domain for managing MCP users, roles, and clients.
- An OCI Object Storage bucket, if required by the workshop configuration.
- Permissions to create and manage Database Tools MCP Server resources.



> ***IMPORTANT — Pre-configured Environment.*** The MCP servers used in this HOL are **preconfigured** and ready to use for this session. The configuration steps included in the following tasks are provided for instructional purposes only and will be discussed during the session. ***You do not need to perform these steps unless instructed.***

## Task 1: Configure MCP Server for Oracle AI Database. 

In this task, you will create an OCI Database Tools MCP Server and associate it with the Database Tools Connection for the Oracle AI Database.

The MCP Server provides the managed MCP endpoint that AI applications will use to access approved database capabilities.

1. Sign in to the **Oracle Cloud Console**.

2. Open the **Navigation menu**.

3. Select **Developer Services**.

4. Under **Database Tools**, select **Model Context Protocol Servers**.

   > **Note:** Database Tools MCP Servers are managed MCP endpoints provided by OCI. They use Database Tools Connections to communicate with Oracle Database.

5. On the **Model Context Protocol Servers** page, click **Create Model Context Protocol server**.

6. On the **Create Model Context Protocol server** page, configure the server using the workshop resources.

   | Field | Value |
   | --- | --- |
   | Name | `mcpserver` |
   | Compartment | Select the workshop compartment |
   | Domain | Select the workshop IAM Identity Domain |
   | Connection | Select the Database Tools Connection for the Oracle AI Database |
   | Object Storage compartment | Select the workshop compartment |
   | Object Storage bucket | Select the workshop bucket |

   > **Note:** The Database Tools Connection determines which Oracle Database the MCP Server accesses.

7. Expand **Advanced options**.

8. Review the **OAuth options**.

   The access token expiration determines how long a Personal Access Token remains valid after it is issued.

   For this workshop, retain the value provided by the workshop environment unless instructed otherwise.

9. Under **Settings**, review **Runtime Identity**.

   The MCP Server supports two runtime identity models:

   - **Authenticated principal** – database operations execute using the authenticated user's identity.
   - **Resource principal** – database operations execute using the MCP Server's workload identity and permissions granted through OCI IAM policies.

   Select the runtime identity specified for this workshop.

   > **Note:** The workshop environment is preconfigured with the IAM policies required for the selected runtime identity.

10. Review the configuration and click **Create**.

11. Wait until the MCP Server is created.

12. Verify that the MCP Server appears on the **Model Context Protocol Servers** page.

### Create an MCP Toolset

An MCP Server exposes database functionality through **toolsets**. Toolsets determine which database operations an MCP client can discover and invoke.

13. Click the MCP Server you created.

14. Select the **Toolsets** tab.

15. Click **Create Model Context Protocol Toolset**.

16. Enter the following information:

    | Field | Value |
    | --- | --- |
    | Name | `SQL Tools` |
    | Description | `SQL tools for the workshop Oracle AI Database` |
    | Compartment | Select the workshop compartment |
    | Type | **Built-in SQL tools** |

17. Configure the **Allowed Roles** according to the workshop environment.

    For example, select the application role assigned to workshop participants.

    > **Note:** Application roles determine which authenticated users and clients can access tools exposed by the MCP Server.

18. Review the configuration and click **Create**.

19. Wait until the toolset is created.

20. Verify that the toolset appears under the **Toolsets** tab.

You have now configured the managed MCP Server and enabled database capabilities that can be discovered by authorized MCP clients.

## Task 2: Validate the MCP Server. 

In this task, you will verify that the MCP Server and its associated resources are correctly configured before connecting an AI application.

1. From **Developer Services**, select **Database Tools**, and then select **Model Context Protocol Servers**.

2. Locate the MCP Server created in Task 1.

3. Verify that the MCP Server is available and its lifecycle state indicates that the resource was created successfully.

4. Click the MCP Server name to open its details page.

5. Review the MCP Server configuration and verify the following:

   - The correct **compartment** is selected.
   - The correct **IAM Identity Domain** is associated with the server.
   - The server uses the expected **Database Tools Connection**.
   - The expected runtime identity is configured.

6. Select the **Toolsets** tab.

7. Verify that the toolset created in Task 1 appears in the list.

8. Open the toolset and verify that the expected database tools are enabled.

### Verify MCP Application Roles

Access to the MCP Server and its tools is controlled using application roles in the associated IAM Identity Domain.

9. Return to the MCP Server details page.

10. Select the **Roles** tab.

11. Verify that the application roles required by the workshop are available.

    Database Tools MCP Servers provide predefined roles including:

    - `MCP_Administrator`
    - `MCP_Operator`
    - `MCP_User`

12. Verify that your workshop user or group has been assigned the application role required to access the MCP Server.

> **Important:** A user must have an appropriate MCP application role before the user can access MCP tools or obtain the credentials required to connect an MCP client.

The MCP Server is now configured and ready to accept connections from authorized MCP clients.

## Task 3: Register a Client to the MCP Server. 

Before an AI agent or other MCP-compatible application can connect to the managed MCP Server, the application must be registered as an MCP client.

Client registration establishes the application's identity and OAuth configuration in the IAM Identity Domain associated with the MCP Server.

In this task, you will create the client registration that will be used in a later lab.

1. From the **Model Context Protocol Servers** page, click the MCP Server created earlier.

2. Select the **Clients** tab.

3. Click **Register Model Context Protocol client**.

4. Enter a name for the client.

   For example:

   ```text
   workshop-mcp-client
   ```

5. Enter a description.

   For example:

   ```text
   MCP client for the Multicloud Enterprise AI Assistant workshop
   ```

6. Select the **Client Type** required for the workshop.

   MCP client registrations support different client types depending on where the application runs:

   - **Public** – intended for applications running on user devices that cannot securely store client secrets.
   - **Confidential** – intended for server-side applications capable of securely storing credentials.
   - **Trusted** – intended for trusted server-side applications that can act on behalf of users.

   Select the client type specified for the workshop architecture.

7. Review the **Allowed grant types**.

   The available OAuth grant types are determined by the selected client type.

8. Review the **Allowed scope**.

   The scope identifies the MCP Server resources that the client is permitted to request access to.

9. If required for the selected client type, enter the **Redirect URI** provided for the workshop client.

10. Review the client configuration.

11. Click **Register**.

12. Wait for the client registration to complete.

13. Open the registered client.

14. On the **Registration Details** page, locate the **Server URL**.

    The Server URL is the remote MCP endpoint that MCP-compatible applications use to communicate with the managed MCP Server.

15. Keep this page available or record the Server URL as instructed by your workshop environment.

    > **Important:** Do not share access tokens, client secrets, or other authentication credentials.

### Verify the Client Registration

16. Return to the **Clients** tab.

17. Verify that `workshop-mcp-client` appears in the list of registered clients.

18. Confirm that the client is associated with the MCP Server created in Task 1.

The MCP infrastructure required by the later labs is now ready.

## Summary

In this lab, you configured the OCI Database Tools managed MCP Server for Oracle AI Database.

You:

- Created an MCP Server backed by an Oracle Database Tools Connection.
- Configured an MCP toolset to expose approved database functionality.
- Verified the MCP Server, toolset, and application-role configuration.
- Registered an MCP client.
- Located the MCP Server endpoint that an MCP-compatible AI application can use.

The MCP Server provides a managed, HTTPS-based interface between AI applications and Oracle AI Database while maintaining centralized authentication, authorization, and database access controls.

In the next lab, you will use this MCP foundation to build enterprise AI agent capabilities with Oracle Private Agent Factory.

## Learn More

- [Creating a Database Tools MCP Server](https://docs.oracle.com/en-us/iaas/database-tools/doc/creating-mcp-server.html)
- [Working with the Database Tools MCP Server](https://docs.oracle.com/en-us/iaas/database-tools/doc/working-database-tools-mcp-server.html)
- [Database Tools MCP Toolsets](https://docs.oracle.com/en-us/iaas/database-tools/doc/database-tools-mcp-toolsets.html)
- [Registering an MCP Client](https://docs.oracle.com/en-us/iaas/database-tools/doc/registering-mcp-client.html)


## Acknowledgements

**Authors** 

* Leo Alvarado, Vishal Patil, Tammy Bednar, Product Management, Oracle Database Cloud Services, Multicloud 

**Last Updated Date** - August, 2026