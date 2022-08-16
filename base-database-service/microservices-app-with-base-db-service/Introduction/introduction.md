# Introduction

This workshop guides you through the tasks to Deploy a Microservices-based App connected to Oracle Base Database Service

Estimated Time:

**Application Modernization with Microservice Containers, OCI Cloud Database Services and Oracle Multitenant**

As organizations prepare for their journey to the cloud, they often choose to launch an application modernization effort as part of their move to the cloud instead of just using a lift & shift approach.

Today’s modern applications are data driven applications that require the ability to handle many different **types of data** (Relational, Spatial, Graph, Document, … etc.) and **types of workloads** (Transactional, Analytic, ML, IoT, …etc.)
To address these needs developers must decide between the use of Single Purpose “Best-of-Breed” databases for each data type and workload or the use of a single Converged database for all of the data types and workloads.
Today’s modern application must also be agile, portable, & secure allowing for rapid, frequent, and reliable delivery of complex application functions to the market.  Developers have turned to the use of **Microservices** to try and reach this goal often with some unintended consequences.

**Applications built with Microservices** are a suite of loosely coupled services, each running in its own context with a lightweight communication messaging mechanism. These Microservices are normally organized around business capabilities and are independently deployed with their own database with extreme horizontal scale capabilities.

![Microservices Approach](./images/microservices-approach.png" ")

Although Microservices provided the developers the flexibility and agility they were after, the model produced several pain points to the Enterprise architecture. The Microservice design pattern encourages data store independence in which the developer chooses the right database point solution for the characteristic of the individual service. The concept of independent Data Stores (databases) introduces complexities that become exacerbated as the granularity and interdependence of the Microservices grow.
Each single-purpose database that is deployed fragments the data architecture.
Each single-purpose database:

* Introduces different operational needs and limitations, requiring unique management and skills
* Introduces different proprietary APIs, languages, and transaction models
* Introduces data transformation and replication requirements to propagate changes – causing data delays and data divergence
* Introduces the need to separately implement & maintain HA and Security policies in every database to accommodate their differences

![Over Time New Functionality is Converged](./images/converged-mainstream.png" ")

In this article we will discuss how the use of the **Oracle Converged database with Multitenant** can help developers to deliver on the promise of Microservice applications without the pain of fragmented data stores.
In a recent discussion with a group of architects, it became clear to me that there was a need to discuss what a Converged database is and how developers could use it as part of their Microservices architecture to bring value to Enterprise Data versus using a collection of Point Solution databases.

To truly appreciate the need for a converged database we should start by evaluating the needs of our Enterprises data over time and by persona.
**Enterprise DATA often has varying degrees of value to many stakeholders and the value of the DATA to the organization changes over time**.
The value of the data at any particular point in time is directly linked to the viewpoint being analyzed.
For example, the information needed from the data will change as we look at the data from the viewpoint of the varying personas within the levels of the organization such as the:

* OLTP Operations Team
* Local Managers
* Division Directors
* Line of Business VPs
* C-Level Executives
* CEO and Board of Directors

**DATA is important, but INFORMATION is king**.

**INFORMATION** is the thing that provides a competitive advantage, enables innovation, and drives customer loyalty.

**As data ages**, the data often needs to be stored in varying formats to optimize data access performance based on the viewpoint of the stakeholder.

**As our data ages, ETL and Analytics** are often applied to **convert DATA into INFORMATION**.
Having access to accurate, timely Information is what provides the competitive business edge required to be the best of the best.

The Data required to gain the desired competitive edge usually comes from multiple sources.
The data from the various sources can often be correlated; to further enrich the INFORMATION, we can extract and expose patterns that aren't visible when working with individual data sets.

**So which solution is best: Converged database or Point Solution?**

**Well, the answer is it depends**.

You first have to ask what is needed from the data by the various Enterprise stakeholders and the life expectancy of the data.

There are use cases where the value of the data is static or short-lived, such as call logs or login systems that will achieve the most value from being hosted on High Scale, High-Performance Point Solution database platforms.
In many cases, what we find is that the analysis for the database platform selection is not being done at the right layer.

Developers naturally gravitate to point solutions as they are often easier to set up and acquire. The developers have project-specific goals that they are trying to achieve, which often do not include considerations for Enterprise use of the data.

**What do the developers want?**

They want to be able to write applications in a mix of languages and apply the best languages suitable for tackling each unique problem.

They want to be able to deploy services that leverage best-of-breed database solutions for each workload type to get their function delivered to the business quickly.

* Relational
* OLAP
* Document
* Key-value
* Spatial
* Graph
* Analytic

When the use of Point Solutions is applied to Enterprise data, a set of architectural pain points appear:  

* How to integrate the disjointed data sets
* How to share common data across Microservices
* How to secure the data and provide data governance
* How to scale the solutions
* How to provide accurate & consistent data
* Where to store the data
* How to provide a point-in-time recovery

**How do Converged databases address these pain points?**

Converged Databases support multiple workload types and data models while also providing the required data consistency, security, & scale.

Over time, the functionality from Point Solution databases is converged into mainstream converged databases solving many of the architectural pain points listed above.

A converged database helps us to
* Reduce the number of data management systems that we need to support
* Reduce the amount of data and functional integration that we need to build
* Reduce the amount of data movement & data duplication
* Simplify data transformation and data correlation
* Standardize Security Policies and Data Access Methods

**Many architects and developers do not realize that the Oracle database platform is much more than a Relational database engine**.


The Oracle database platform is a multi-model converged architecture that supports multiple data models (Spatial, Graph, JSON, XML), multiple workload types (operational and analytical), multiple data types, multiple algorithms (Machine learning, Statistical Functions, In-Memory Operations) all within a single database platform.

![Database Improvements](./images/db-improvements.png" ")

**Best of all, with a converged database like Oracle, most of the features listed above are included in the Enterprise license at no additional cost**. This allows the architects to improve the ROI of their organization's existing investments and address the architectural pain points posed by Point Solutions while still being able to allow the developers the productivity gains they are after.

The use of the converged database allows the developers the ability to leverage the best data model to access varying data types from within one data platform while still being able to access all of the data from one SQL call.

Utilizing the converged database also allows the developers to take full advantage of the enterprise-class performance, scale, reliability, and security of the Oracle Database to more quickly deliver their use cases to the marketplace.

**Avoiding the need to constantly move data between database systems and build integration code reduces the effort, time, and cost of delivering the value of INFORMATION throughout the entire Information Supply Chain**.

**The Oracle database platform also offers PORTABILITY as a differentiator compared to other converged and point solutions**. The Oracle converged database can be run On-Premise, in the Oracle cloud, and in other clouds. Many of the competing platforms can only be run in the Cloud and at times, only in one specific proprietary cloud.  Selecting a data platform that is performant, secure, scalable, highly available,  and portable is critical for supporting our customers' digital transformation journey.

When developers add the use of **Oracle Multitenant** to their Microservice architecture, they are able to fully deliver on the efficiency & scale objectives of the model without increasing complexity or sacrificing performance and scale. Multitenant helps them to deliver efficient, agile database clouds without the need to copy data everywhere & provides access to real-time, current data. The Multitenant feature is fully portable and is available on-premise, in the Cloud, and on Oracle’s fully managed Autonomous Database.


## Lab Breakdown


* Lab 1. Create an Oracle Base Database Service Instance
* Lab 2. Create The Cloud Application Tier
* Lab 3. Configure Cloud Microservice Application Tier to connect to Oracle Base Database Service
* Lab 4. Build The Application       
* Lab 5. Run The Application






## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler Product Management

* **Contributors** - Tammy Bednar, Product Management

* **Last Update** - July 2022.

**You are all set. Let us begin!**
