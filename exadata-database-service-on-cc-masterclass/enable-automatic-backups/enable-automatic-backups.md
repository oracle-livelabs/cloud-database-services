


# Review Enable Automatic Backups


## Introduction

This lab walks you through the steps to Enable Automatic Backups.

Estimated Lab Time: 15 minutes

<!-- Watch the video below for a quick walk-through of the lab.
[Create an Exadata Database Service on Cloud@Customer Infrastructure](youtube:DCrivNA5bs8)
-->
### Objectives

-   After completing this lab, you should be able to Enable Automatic Backups

### Prerequisites

This lab requires completion of the following:

* Completion of **Lab8**

## Task 1: Enable Automatic Backups 

*(For this lab, Informational Instructions for Enabling Automatic Backups for the Exadata Database Service on Cloud@Customer environment will be presented by the speakers)*

1. Open the navigation menu. Under **Oracle Database**, click **Exadata Database Service on Cloud@Customer**.
   
2. Select your ***Assigned Compartment***, and Click your assigned **VM Cluster** named ***MyVMClusterXX***.

3. In the Resources list of the VM Cluster Details page, click Databases.

4. Click the name of the database for which you want to edit backup settings.

5. Click Edit Backup Settings.
   
   Your current backup configuration determines the changes that you can make in the Backup Settings dialog, as follows:

   If automatic backups are not configured (Backup Destination Type is set to None), then you can use the following settings to define the backup configuration for the database:

   **Backup Destination Type**: From the list, choose an option.

      * **None** Select if you do not define a backup configuration for the database.
      * **Local** Select to store backups locally in the Exadata Storage Servers on your Exadata Database Service on Cloud@Customer system.
      * **Object Storage** Select to store backups in an object storage container managed by Oracle on Oracle Cloud Infrastructure.
      * **NFS** Select to store backups in one of your previously defined backup destinations that uses Network File System (NFS) storage.
      * **Recovery Appliance** Select to store backups in one of your previously defined backup destinations that uses Oracle Zero Data Loss Recovery Appliance.
   
   **Enable automatic backups**: Select this option to enable daily backups using the policy for automatic backups.

   **Backup retention period**: Select this option to choose one of the options for the length of time that automatic backups are retained.
6. Click **Save Changes**.


You may now **proceed to the next lab**

## Learn More

* Click [here](https://docs.oracle.com/en/engineered-systems/exadata-cloud-at-customer/ecccm/ecc-provisioning.html#GUID-4CB5B5E1-E853-4CA2-B43D-54CD18A8F28A) to learn more about Creating Infrastructure resource for Exadata Database Service on Cloud@Customer.

## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler, Product Management

* **Contributors** - Tammy Bednar, Product Management

* **Last Updated By** - Leo Alvarado, Product Management, September 2023.
