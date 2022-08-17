# Introduction

This workshop guides you through the tasks to get started using the Oracle Exadata Database Service on Dedicated Infrastructure.

Estimated Time: 1 hour, 35 minutes

**Oracle Exadata Database Service**

Oracle Exadata Database Service is a high-performance co-managed Oracle Cloud Database service that allows organizations to run databases with extreme performance, availability, and security cost-effectively. Databases run faster and with fewer resources on scale-out Exadata infrastructure that includes unique optimizations for transaction processing, analytics, and mixed workloads. Online scaling of computing resources enables customers to quickly adjust consumption to match workload demands without interrupting operations, while efficient database consolidation further lowers total costs. Full compatibility with on-premises Oracle Database and Exadata environments makes it easy for customers to migrate workloads to the cloud.

Exadata Database Service allows you to leverage the power of Exadata in the cloud. Exadata Database Service's scale-out architecture will enable customers to provide more computing and storage independently and efficiently, right-sizing their service to meet growing demands. Exadata Database Service offers RDMA over Converged Ethernet (RoCE) networking for high bandwidth and low latency, persistent memory (PMEM) modules, and intelligent Exadata software.

Built-in Oracle Maximum Availability Architecture (Oracle MAA) best practices increase database availability. Exadata Database Service reduces downtime and simplifies operational management with zero downtime maintenance, online scaling, and one-click provisioning of Oracle Real Application Clusters (Oracle RAC) and Oracle Active Data Guard using built-in cloud automation.

**Network Overview: Exadata Database Service on Dedicated Infrastructure**
![Network Overview of Exadata Database Service on Dedicated Infrastructure](./images/exa-db-d-architecture.png" ")


The Diagram outlines the high-level network architecture for Exadata Database Service on Dedicated Infrastructure.

**The Exadata Database Service on Dedicated Infrastructure** runs on the Exadata hosts, virtualized with **Dom0** for Oracle-managed components and **DomU** for user-managed components.
Each Exadata Database Service instance provides 50 Gbps networks for customer access: (Client and Backup).
Each Exadata Database Service instance provides a 1Gbps Cloud Operations network for use by the Oracle Cloud Infrastructure Operation team for Infrastructure maintenance.

**The Client Network** connects the Exadata database servers to your existing client network and is used for client access to the virtual machines.
Applications access databases on Exadata Database Service through this network using Single Client Access Name (SCAN) and Oracle Real Application Clusters (Oracle RAC) Virtual IP (VIP) interfaces.
The client access network uses a pair of network interfaces on each database server connected to the customer network.

**The Backup Network** is similar to the client access network, as it connects the Exadata database servers provided to separate backup traffic and bulk transfers from application traffic.
Like the client network, the backup network uses a pair of network interfaces on each database server connected to the customer network.

**The Oracle Cloud Operations Network** is a dedicated network connection used to perform infrastructure management tasks.
This network is solely for infrastructure management purposes conducted by the Oracle Operations team and cannot be accessed by customers.

**The RDMA Over Converged Ethernet (ROCE) Fabric Network** connects the Exadata database servers and Exadata storage servers using the ROCE switches on the rack. Each database server and storage server contains two ROCE interfaces (re0 and re1) connected to separate ROCE switches in the rack. Oracle Database uses this network for Oracle RAC cluster interconnect traffic and accessing data on Exadata storage servers.

When you subscribe to the Exadata Database Service on Dedicated Infrastructure, Oracle owns and manages the Exadata Infrastructure, and customers manage everything that runs in the database VM. The Customer VM, DOMU, includes the database software, grid infrastructure, data, schema, and encryption keys. You can schedule maintenance windows for Oracle to perform infrastructure maintenance during a time that best aligns with their business needs.

The Exadata Database Service simplifies lifecycle tasks, such as provisioning, scaling, patching, backup, and disaster recovery through Oracle Cloud Infrastructure Automation.

Application users and administrators can connect only to the database servers, using the CLIENT and BACKUP networks you previously created with your VCN.   Your administrator can use the web-based OCI Console, OCI command-line interface (CLI), and REST APIs to connect to your Exadata Database Service over an HTTPS connection.  You can access your database through standard Oracle connection methods, such as Oracle Net, and connect to the VM cluster through traditional Oracle Linux methods, such as token-based Secure Shell (SSH).

These hands-on lab guides provide step-by-step directions to setting up and using your Exadata Database Service on Dedicated Infrastructure.


## Lab Breakdown


* Lab 1. Create your Virtual Cloud Network (VCN) and Required IAM Policy for Exadata Database Service on Dedicated Infrastructure
* Lab 2. Create an Exadata Cloud Infrastructure resource
* Lab 3. Create a Cloud VM Cluster resource
* Lab 4. Create Oracle Database Home on an Exadata Database Service on Dedicated Infrastructure       
* Lab 5. Create Oracle Database on an Exadata Database Service on Dedicated Infrastructure
* Lab 6. Enable Automatic Backups for a Database
* Lab 7. Enable Data Guard on an Exadata Database Service on Dedicated Infrastructure





## Acknowledgements

* **Author** - Leo Alvarado, Product Management

* **Contributors** - Tammy Bednar, Eddie Ambler, Product Management

* **Last Update** - July 2022.

**You are all set. Let us begin!**
