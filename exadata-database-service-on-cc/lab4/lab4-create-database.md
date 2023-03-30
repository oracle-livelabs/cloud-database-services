# Create Oracle Database on Exadata Database Service


## Introduction

This lab walks you through the steps to create Oracle Database on Exadata Database Service using the OCI Console.

Estimated Lab Time: 15 minutes

Watch the video below for a quick walk-through of the lab.
[Create Oracle Database](youtube:JJ4Wx0l0gkc)

### Objectives

-   After completing this lab, you should be able to create a database on Exadata Database Service


### Prerequisites

This lab requires completion of the following:

* Completion of Lab3

## Task 1: Create an Oracle Database on Exadata Database Service

1. Open the navigation menu. Under **Oracle Database**, click **Exadata Database Service on Cloud@Customer**.

   VM Clusters is selected by default.

2. Choose your **Compartment**. A list of VM Clusters is displayed for the chosen Compartment.

3. Click the name of a VM cluster where you want to create the database. In the VM Cluster Details page, under **Resources**, **Databases** is selected by default.

4. Click **Create Database**.

5. Provide the requested information in the Create Database page:

    * **Provide the database name:** Specify a name that you can use to identify the database.

    * **Provide a unique name for the database:** Optionally, specify a unique name for the database.

    * **Select a database version:** From the list, choose the Oracle Database software release that you want to deploy.

    * **Database Home:** Select an existing Database Home or create one as applicable.

        * **Select an existing Database Home:** Select this option if you have one or more Database Homes already exist for the database version you have selected. Select a Database Home from the list.

        * **Create a new Database Home:** Select this option If no Database Homes exist for the database version you have selected.

          * **Enter Database Home display name.**

          * Click **Change Database Image** to select your software version. Select a Database Software Image window is displayed.

          * Select an **Image Type**, **Oracle Provided Database Software Images**, or **Custom Database Software Images**. If you choose **Oracle Provided Database Software Images**, then you can use the **Display all available version** switch to choose from all available PSUs and RUs. The most recent release for each major version is indicated with a **latest** label.

     * **Provide the name of the first PDB:** Specify the name for the first PDB. A PDB is created with the database.

     * **Provide the administration password:** Provide and confirm the Oracle Database administration password.

        * **Use the administrator password for the TDE wallet:** When this option is checked, the password entered for the SYS user is also used for the TDE wallet. To set the TDE wallet password manually, uncheck this option and enter the TDE wallet password.

     * **Choose the database workload type:** Select the workload type that best suits your application from one of the following options:

        * **Transactional Processing:** Select this option to configure the database for a transactional workload.

        * **Data Warehouse:** Select this option to configure the database for decision support or data warehouse workload.

     * **Backup Destination Type:** Select a backup destination for the database. Select the **Enable automatic backups:** to enable daily backups using the policy for automatic backups.

        * **None:** Select to not define a backup configuration for the database.

        * **Local:** Select to store backups locally in the Oracle Exadata Storage Servers on your Oracle Exadata Database Service on Cloud@Customer.

        * **Object Storage:** Select to store backups in an Oracle-managed object storage container on Oracle Cloud Infrastructure.

        * **NFS:** Select to store backups in one of your previously defined backup destinations that use Network File System (NFS) storage.

        * **Recovery Appliance:** Select to store backups in one of your previously defined backup destinations that use Oracle Zero Data Loss Recovery Appliance.

      * Select **Show Advanced Options.**

        * **Provide the Oracle SID prefix:**

        * **Backup retention period:** From the list, you can choose the length of time that you want automatic backups to be retained.

        * **Character set:** The character set for the database.

        * **National character set:** The national character set for the database.

        * **Tags:** You can choose to apply tags.

6. Click **Create Database.**



## Want to Learn More?

Click [here](https://docs.public.oneportal.content.oci.oraclecloud.com/en-us/iaas/exadata/doc/ecc-create-first-db.html) to learn more about Creating an Oracle Database on Exadata Database Service.

## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler, Product Management

* **Contributors** - Tammy Bednar, Product Management

* **Last Update** - Feb 2023.
