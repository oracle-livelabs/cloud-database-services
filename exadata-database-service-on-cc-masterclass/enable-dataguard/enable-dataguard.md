


# Enable Data Guard for local HA using OCI Console


## Introduction

This lab walks you through the steps to Enable Data Guard using OCI Console.

Estimated Lab Time: 15 minutes

<!-- Watch the video below for a quick walk-through of the lab.
[Create an Exadata Database Service on Cloud@Customer Infrastructure](youtube:DCrivNA5bs8)
-->
### Objectives

-   After completing this lab, you should be able to Enable Data Guard using OCI Console

### Prerequisites

This lab requires completion of the following:

* Completion of **Lab2**


## Task 1: Enable Data Guard using OCI Console

1. In the Breadcrumb link, Click on **Oracle Exadata Database Service on Cloud@Customer**. 
   
   ![Navigate to Exadata VM Cluster](./images/navigate-exadbcc-vmcluster.png " ")
   
2. In the left rail, **Exadata VM Clusters** is selected by default. Select your assigned Compartment ***MyCompartmentXX*** then Click on the name of your assigned VM Cluster ***MyVMClusterXX***.
   
   ![Select assigned Compartment and assigned VM Cluster](./images/select-compartment.png " ")

3. On the left rail, under **Resources** of the VM Cluster details page, select **Databases** and from the list of the displayed databases click the container database named ***MyCDB01***. 
   
   ![Select CDB](./images/select-cdb.png " ")

4. In the Container Database details page, under **Resources**, click **Data Guard Associations**.
   
   ![Click on Dataguard Associations](./images/navigate-dg-association.png " ")

5. Click **Enable Data Guard**. 

   ![Click Enable Data Guard](./images/enable-dataguard.png " ")

   In the Enable Data Guard page, configure your Data Guard association.
    
    **Select Peer VM Cluster**: 

       * **Peer Region**: Select your **assigned peer region** ***"US East (Ashburn) OR US West (San Jose)"***.
  
         >**Note:** The primary and standby databases could be running on two different VM clusters on a shared ExaDB-C@C system or on two geographically separated ExaDB-C@C systems managed from the same or different Oracle Cloud Infrastructure regions. For this lab, the primary and standby database will be running on a shared ExaDB-C@C system on the same region.
    
       * **Exadata Cloud@Customer Infrastructure**: Select the Exadata Database Service on Cloud@Customer infrastructure where the standby database is located. Click the **Change Compartment** hyperlink and select ***OCW23ExaDBCC*** for the compartment. 
         
         Select your **assigned Exadata Cloud@Customer Infrastructure**. 
    
       * **Peer VM Cluster**: Select the Exadata VM Cluster that contains the standby database. Click the **Change Compartment**, select ***MyStandByCompartment_{Region}*** then select ***MyStandbyVMCluster*** for the Peer VM Cluster
  
   ![Select Peer VM Cluster](./images/select-peer-vmcluster.png " ")
    
    **Data Guard Assocation Details:**
    
       * **Select the Data Guard type**: Select Active Data Guard or Data Guard. For this lab, select ***Active Data Guard***
    
       * **Protection mode**: Select a protection mode the Data Guard association. For this lab, select ***Maximum Performance***

   ![Select Data Guard Association](./images/dg-association-details.png " ")

    **Choose Database Home**: Choose ***Select an existing Database Home*** then select ***MyStandbyDBHome*** for the Database Home.

  
   ![Choose Database Home](./images/choose-database-home.png " ")

    **Configure standby database**: Provide the unique name for the standby database. 
    
       * Provide the **Database password**. For this lab, use the assigned password ***Pass4Stud3nt-#*** 

6. Click **Enable Data Guard**.

   ![Click Enable Data Guard](./images/click-enable-dataguard.png " ")
   
   The Data Guard Association process will run in the background. When the association is created, the details for a database and its peer display their respective roles as ***Primary*** or ***Standby***.
  



You may now **proceed to the next lab**

## Learn More

* Click [here](https://docs.oracle.com/en/engineered-systems/exadata-cloud-at-customer/ecccm/ecc-using-data-guard.html#GUID-6EBC4D6A-C58B-4721-B756-F22FC6819A45) to learn more about using Oracle Data Guard with Exadata Database Service on Cloud@Customer.

## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler, Product Management

* **Contributors** - Tammy Bednar, Product Management

* **Last Updated By** - Leo Alvarado, Product Management, September 2023.
