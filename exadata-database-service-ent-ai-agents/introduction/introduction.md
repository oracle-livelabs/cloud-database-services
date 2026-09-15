# Building a Multicloud Enterprise AI Assistant on Oracle AI Database

## Introduction
Enterprise AI is moving beyond chatbots and Retrieval-Augmented Generation (RAG) applications. Modern AI applications combine enterprise knowledge, live business data, APIs, and autonomous reasoning to accomplish real business tasks.

In this workshop, you'll build an Enterprise AI Agent using Oracle AI Database and Oracle AI Database Private Agent Factory. You'll create a Knowledge Agent grounded on enterprise documentation, build a Custom Agent that securely interacts with a live Oracle Database through an MCP Server, expose the agent as a REST API, and integrate it with an external AI service such as Amazon Bedrock or Azure AI Foundry.

You'll also explore how Oracle Private AI Container Service  enables private inference using customer-managed embedding models and large language models, allowing enterprise AI workloads to remain entirely within a private environment.

By the end of this workshop, you'll understand how Oracle AI Database serves as the enterprise AI platform while allowing applications and AI frameworks to run on any cloud.

### **Oracle Exadata Exascale: World’s Only Intelligent Data Architecture for Cloud**


Exadata Exascale is Oracle’s revolutionary multitenant architecture that combines the intelligence of Exadata with all the benefits of modern clouds. This loosely-coupled architecture incorporates the Exascale intelligent storage cloud and a pool of Exascale database-optimized compute to provide hyper-elasticity while meeting even the most demanding workload requirements.

![introduction](./images/introduction.png " ")

When running Exadata Database Service on Exascale Infrastructure, you have access to its intelligent capabilities across your application portfolio. Database-optimized intelligent infrastructure runs AI, analytics, mission-critical OLTP, and developer workloads faster and more efficiently, reducing overall IT costs. Some of these capabilities include:

* Intelligent AI: The combination of AI Smart Scan with Exadata System Software 24ai offloads key AI Vector Search operations to the Exascale intelligent storage cloud, enabling massive amounts of vector data to be searched up to 30X faster.

* Intelligent analytics: The combination of intelligent columnarization and Smart Scan make hundreds or thousands of processing cores in the Exascale intelligent storage cloud available to process any SQL query.

* Intelligent OLTP: Exascale’s intelligent architecture automatically tiers data between DRAM, flash, and disk enabling low-latency, high-throughput Remote Direct Memory Access (RDMA) to frequently accessed data and delivers the performance of DRAM, the IOPS of flash, and the capacity of disk.

* Database-aware intelligent clones:The Exascale intelligent storage cloud uses redirect-on-write snapshot technology to instantly create space-efficient database clones from read-write sources.

Starting today, you can enjoy Exadata Database Service benefits at a lower entry cost for smaller, but no less critical, databases. Exadata Database Service on Exascale Infrastructure bridges the gap between dedicated Exadata infrastructure and virtual machines on shared commodity infrastructure. It extends Exadata’s advantages to every organization in every industry, regardless of size or workload.

You can start small using virtual machine (VM) cluster configurations with as little as 8 ECPUs and 22 GB of memory per VM, and 300 GB of intelligent database storage. You can easily scale up the number of ECPUs and number of VMs in the cluster, and then shrink them when you don’t need them. To ensure ECPU capacity is available when you need it, you can reserve ECPUs at a nominal cost.



**Estimated Workshop Time:** 120 minutes.

### Objectives

After completing this workshop, you will be able to:

* Understand the architecture of enterprise AI agents
* Create a Knowledge Agent using Oracle AI Database Private Agent Factory
* Build a Custom Agent using MCP Server integration
* Securely query Oracle AI Database through AI agents
* Expose AI agents as REST APIs
* Integrate Oracle AI agents with Amazon Bedrock or Azure AI Foundry
* Understand how Oracle Private AI Container Service enables private AI deployments
* Build multicloud AI applications while keeping enterprise data governed inside Oracle AI Database

Users are encouraged to skip around to the lab most pertinent to them.

### Prerequisites

* An OCI Tenancy with the assigned username and password.
* An Agent Factory Instance with the assigned username and password.
* An Exascale Database Instance 



You may now **proceed to the next lab**

## Acknowledgements

**Authors** 

* Leo Alvarado, Vishal Patil, Tammy Bednar, Product Management, Oracle Database Cloud Services, Multicloud 

**Last Updated Date** - April, 2026
