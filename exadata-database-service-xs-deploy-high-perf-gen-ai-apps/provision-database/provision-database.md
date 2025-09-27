# Create an Oracle Database on Oracle Exadata Database Service on Exascale Infrastructure


## Introduction

This lab walks you through how to create an Oracle Database on the Oracle Exadata Database Service on Exascale Infrastructure using the OCI Console. 
 

**Estimated Time:** ***10 minutes***

### Objectives

-   After completing this lab, you should be able to create an Oracle Database on Oracle Exadata Database Service on Exascale Infrastructure using the OCI Console.

### Prerequisites

* A provisioned Oracle Exadata Database Service on Exascale Infrastructure VM Cluster to host the database.

## Task 1: Provision an Oracle Database

1. Open the navigation menu. Under **Oracle Database**, click **Exadata Database Service on Exascale Infrastructure**.

   ![Navigate to Exascale page using the console](./images/navigate-oci-console.png "Navigate to Exascale page using the console")

2. Select your assigned **Region** and select your assigned **compartment** from the applied filter to navigate to your assigned **Exascale VM Cluster**.  
   
   ![Navigate to the VM Cluster page](./images/select-compartment.png "Navigate to the VM Cluster page")
   
   Click the name of your assigned VM Cluster to open the **VM Cluster** page.
   
   ![Navigate to the VM Cluster page](./images/select-vm-cluster.png "Navigate to the VM Cluster page")

3. In the **VM Clusters** page, click on the **Container databases** tab and click ***Create container database***.

   ![Image showing create CDB](./images/create-cdb.png "Image showing create CDB")

4. In the **Create Container Database** page enter the **basic information for creating the container database:**
   
     * For the **Database Name:** Enter ***DemoDB01***
     * For the **Database Unique Name Suffix:** Enter ***DemoDB_23aiExascale***
     * For the **Pluggable Database Name:** Enter ***MyPDB01***
     * For the **Database release:** Select ***23ai***  
     * For the **Database Home source** choose: ***Select an existing Database Home***
     * Select Database Home with display name of ***MyDemo23aiDBhome01***

   ![Image showing the basic container database information to enter](./images/create-cdb-details.png "Image showing the basic container database information to enter")

     * Next configure your **Administrator Credentials:** by entering ***Pass4AIW25Student-#*** as the password for the ***sys*** username

   ![Image showing Administrator credentials to enter](./images/enter-administrator-credentials.png "Image showing Administrator credentials to enter")


5. In the **Configure Database backups** page, if you accept the defaults setting, the database will be backed up using the Oracle Database Autonomous Recovery Service. You have the option to use OCI Object Storage by changing the **Backup destination**. 
   
   ![Image showing database backup configuration options](./images/configure-db-backup.png "Image showing database backup configuration options")
   
   For this lab, we will not be enabling **Automatic Backups** for the database during the create database workflow.
    * ***Uncheck*** **the box for:** ***Enable Automatic Backups***

   ![Image showing database backup configuration options](./images/disable-auto-backup.png "Image showing database backup configuration options")
      
6. **Review & Configure Advanced Options** for the Container Database by clicking on the ***Show Advanced Options*** link.
   
   Under the **Management tab** set the Oracle_SID to ***ExascaleDemo***

   ![Image showing Oracle SID and Character set selection](./images/select-sid-character-set.png "Image showing Oracle SID and Character set selection")

   Under the **Encryption tab** you can select the desired key management method. Select ***Use Oracle-managed keys***.

   ![Image showing console connection copy SSH string options](./images/select-encryption-option.png "Image showing console connection copy SSH string options")

   Under the **Tags tab:** you can add free-form tags to your resource.  If you want to apply a defined tag, you must have permissions to use the tag namespace. Remember that you can also apply tags to your resources after they are provisioned.

   
7. Click ***Create*** to create the container database.

   ![Image showing the option confirm creation of container database](./images/click-create-container-db.png "Image showing the option confirm creation of container database")

***!!! Congratulations:*** You may now **proceed to the next lab**. 
 

## Learn More

* Click [here](https://docs.oracle.com/en-us/iaas/exadb-xs/index.html) to learn more about the Exadata Database Service on Exascale Infrastructure.

## Acknowledgements

* **Author** - Leo Alvarado, Christian Craft Product Management

* **Last Updated By** - Leo Alvarado, Product Management, Aug 2025.
