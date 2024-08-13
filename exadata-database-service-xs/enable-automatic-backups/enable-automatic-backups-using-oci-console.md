


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

* Completion of **Lab1**

## Task 1: Enable Automatic Backups 

*(For this lab, Informational Instructions for Enabling Automatic Backups for the Exadata Database Service on Cloud@Customer environment will be presented by the speakers)*

1. Navigate to the Exadata Database Service on Exascale Infrastructure using OCI Console

    * Open the **navigation menu** and click ***Oracle Database***. 
    * Under **Oracle Database**, click ***Oracle Database Service on Exascale Infrastructure***.
  ![Navigate from OCI Console to ExaDB-XS](./images/console-to-exadb-xs.png " ") 
    * **Note:** This will cause the **VM Clusters** page to be displayed.

2. Navigate to your Compartment and VM Cluster

    * On the left rail, ensure that **VM Clusters** is selected (default selection). 
    * For the **List Scope**, select your assigned compartment named ***MyCompartmentXX***. 
    * In the list of displayed VM clusters, click on the name of your **Assigned VM Cluster** named ***MyDemoVMClusterXX***.
  ![Navigate to Compartment and VM Cluster](./images/select-compartment-and-mydemo-vm-cluster.png " ")
    * **Note:** This will cause the **VM Cluster Details** page to be displayed.

3. Navigate from the VM Cluster to the Container Database (CDB)

    * On the left rail under the **Resources** section, click on ***Container Databases***, 
    * In the list of Container Databases diplayed, click on the name of the Container Database for which we will **enable Automatic Backups**. Click on ***MyDemoDB***. 
  ![Navigate from VM Cluster to Container Database (CDB)](./images/mydemo-vm-cluster-details-page-to-cdb.png " ")
    * **Note:** This will cause the **Container Database Details** page to be displayed.

4. Click on the **Configure Automatic Backups** action button.
* **Note:** This will cause the **Configure Automatic Backups** page to be displayed.
 ![Launch Congigure Automatic Backups Action](./images/launch-configure-automatic-backups.png " ")
   
5. Now lets **configure Automatic Backups** for the database
    * **Select the checkbox** for ***Enable Automatic Backups***
    * For the **Backup Destination:** Select ***Autonomous Recovery Service***
    * For the **Protection Policy:** Select ***Silver***
    * For the **Deletion options after database termination:** Select ***Retain backups according to the protection policy retention period***
    * For this lab, we will **defer the initial backup** by **unchecking** the checkbox for ***Take the first backup immediately***
    * Next, **schedule the Day of the week and time for the initial backup to start:** Select ***Sunday between 4AM and 6AM***.
    * Now wrap up the Automatic Backup configuration by **scheduling the time of day for the daily backups to start:** Select ***4AM to 6AM***
    * Click ***Save Changes*** to save the configuration and start automatic backups as defined.

  ![Configure Automatic Backups](./images/configure-automatic-backups-to-rcv.png " ")



You may now **proceed to the next lab**

## Learn More

* Click [here](https://docs.oracle.com/en/engineered-systems/exadata-cloud-at-customer/ecccm/ecc-manage-db-backup-and-recovery.html#GUID-07D1B1D6-4A06-4859-B7DF-4C3A681A6B40) to learn more about Managing Database Backup and Recovery on Oracle Exadata Database Service on Cloud@Customer.

## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler, Product Management

* **Contributors** - Tammy Bednar, Product Management

* **Last Updated By** - Leo Alvarado, Product Management, September 2023.
