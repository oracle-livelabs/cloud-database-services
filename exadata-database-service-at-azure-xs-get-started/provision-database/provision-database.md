# Create Oracle Database on Oracle Exadata Database Service on Exascale Infrastructure on Oracle Database@Azure


## Introduction

This lab walks you through how to create an Oracle Database on the Oracle Exadata Database Service on Exascale Infrastructure on Oracle Database@Azure using the OCI Portal. 
 

**Estimated Time:** ***30 minutes***

### Objectives

-   After completing this lab, you should be able to create an Oracle Database on Oracle Exadata Database Service on Exascale Infrastructure on Oracle Database@Azure using the OCI Console.

### Prerequisites

* A provisioned Oracle Exadata Database Service on Exascale Infrastructure on Oracle Database@Azure Instance.

## Task 1: Provision an Oracle Database

1. Go to the Oracle Exascale VM cluster Overview page, In the OCI Database URL, click the ***Go to OCI*** link.

![Image showing the option to login to OCI](./images/azure-vm-cluster-go-to-oci-link.png "Image showing the option to login to OCI")

2. Log in to the OCI Console and navigate to **VM Cluster Details**.

![Image showing VM Cluster details page](./images/oci-vm-cluster-details-page.png "Image showing VM Cluster details page")

3. Select **Container databases** and click ***Create container database***.

![Image showing create CDB](./images/create-cdb.png "Image showing create CDB")

4. In the **Create container database** page, enter the following information.
   
* **Basic information for container database:**
     * **Provide the database name:** Enter a name for the database.
     * **Provide a unique name for the database ***(Optional)***:** Enter a unique name for the database
     * **Select a database version:** Select the database version available.
     * **Provide a PDB name ***(Optional)***:** Enter the name of the first PDB to be created.

![Image showing the basic container database information to enter](./images/create-cdb-details.png "Image showing the basic container database information to enter")

* **Specify a database Home:**
     * **Database Home source:** Select to use an ***existing Database Home*** or ***Create a new Database Home***.
     * **Database Home display name:** Use the default database home name or enter a database home name.
     * **Change Database Image ***(Optional)***:** Determines what Oracle Database version is used for the database. By default, the latest Oracle-published database software image is selected. Select to use an older Oracle-published image or a custom database software image that you have created in advance.

![Image showing Database Home selection](./images/enter-database-home.png "Image showing Database Home selection")

* **Create administrator credentials:**
     * **Password:** Password must be 9 to 30 characters and contain at least 2 uppercase, 2 lowercase, 2 special, and 2 numeric characters. The special characters must be `\`, `_`, `#`, or `-`.
     * **Confirm Password:** Enter the same password.

![Image showing Administrator credentials to enter](./images/enter-administrator-credentials.png "Image showing Administrator credentials to enter")


5. In the **Configure Database backups** page, if you accept the defaults setting, the database will be backed up using the Oracle Database Autonomous Recovery Service. You have the option to use OCI Object Storage by changing the **Backup destination**. The database will not be backed up if you deselect **Enable automatic backups**. Automatic backups can be enabled after the container database is created.

![Image showing database backup configuration options](./images/configure-db-backup.png "Image showing database backup configuration options")
      
6. Click **Show advanced options** and enter the following information.

   -  **Management:** You can add **Oracle SID prefix (_Optional_)** and select the **Character set** and **National Character set**.

![Image showing Oracle SID and Character set selection](./images/select-sid-character-set.png "Image showing Oracle SID and Character set selection")

   - **Encryption:** Configure key management, you have options to manage database keys. Select **Use Oracle-managed keys** to manage database keys using the wallet or select **Use customer-managed keys** to manage database keys using OCI Vaults.

![Image showing console connection copy SSH string options](./images/select-encryption-option.png "Image showing console connection copy SSH string options")

   - **Tags:** Apply free-form or defined tags to this resource.

![Image showing the option to add container database tags](./images/enter-container-db-tag.png "Image showing the option to add container database tags")

7. Click **Create** to create the container database.

![Image showing the option confirm creation of container database](./images/click-create-container-db.png "Image showing the option confirm creation of container database")

   Once the provisioning process of the container database is completed, the state of the container database will show as **Available**.

![Image showing created container database](./images/created-cdb.png "Image showing created container database")

1.  In the **Database details** page, select the **Pluggable Databases** tab.

![Image showing created pdb](./images/click-pdb.png "Image showing created pdb")

   Click **Pluggable Database** to view the details of the pluggable database.

![Image showing created pdb](./images/click-pdb-details.png "Image showing created pdb")

***!!! Congratulations:*** You may now **proceed to the next lab**. 
 

## Learn More

* Click [here](https://docs.oracle.com/en-us/iaas/exadb-xs/index.html) to learn more about the Exadata Database Service on Exascale Infrastructure.

## Acknowledgements

* **Author** - Leo Alvarado, Tammy Bednar,  Product Management

* **Last Updated By** - Leo Alvarado, Product Management, August 2025.
