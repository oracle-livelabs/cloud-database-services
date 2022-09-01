# Create Oracle Base Database Service Instance


## Introduction

This lab walks you through the steps to Create Oracle Base Database Service Instance.

Estimated Time: 15 minutes




### Objectives

-   Create Oracle Base Database Service Instance.

### Prerequisites

This lab requires completion of the following:

* Setting Up Your Tenancy - After Oracle creates your tenancy in OCI, an administrator at your company will need to perform some setup tasks and establish an organization plan for your cloud resources and users.




## Task 1: Create Oracle Base Database Service Instance.

1.  Login into the OCI Console and Select Oracle Database

2.	Navigate to the database service that you deployed by selecting Oracle Base Database

3.	Click the “Create DB System” button to proceed.
    * This will bring up the Create DB System Dialog screen

    Follow the steps to fill in the information for the DB System.

4.	Validate that the Compartment shown is where you want your DB System to be created.

5.	Enter a display name for your DB system.

6.	Select the Availability Domain (AD) in which the DB system will resides ensuring to select a region that best meets your business needs and    
    satisfies any data location restrictions.

7.	Select Virtual Machine for the Shape Type option to be used for launching the DB system.
    * The shape type selected determines the list of available shapes to select from in the next step.

8.	Click on Change Shapes
    * For the Shapes, you can choose between AMD or Intel Processors.

9.	Select AMD for the Processor and use the slider bar in the Configure OCPU section to Configure the desired OCPU.  

10.	Click on the Select Shape button to complete the shape selection process

    Now let’s Choose the type of storage management software that we will use with our database VM.

11.	Choose between Oracle Grid Infrastructure or Logical Volume Manager for the Storage Management Software

    * 2 things to note is that Oracle Grid Infrastructure is recommended for production workloads and that Logical Volume Manager is only available for single-node VM systems

    Next, we will configure the storage performance

12.	Choose between Balanced & Higher Performance Storage Volumes

    * For the Available Data Storage, Select the amount of Block storage that you want allocated to the VM DN System.
    * The Recovery Area Storage field displays the amount of storage that will be available for recovery log data (RECO data) based on the amount of storage select ed for the DATA space.
    * You can change the amount of Recovery area storage independently after provisioning

13.	Click on the save changes button to continue configuring the DB system

14.	Next, we will Select the Total number of VM Nodes that will be in our DB System and the Oracle Database Software Edition that will be supported by the DB system

15.	In the Add SSH Keys section of the page we will add our SSH public key to enable access to the VM DB System via SSH.

    * To Add the SSH Public Key portion of the key pair, choose from one of the provided 3 options.

16.	Select the License Type that we want to use for the Virtual Machine DB system.

    * The options are License included or Bring Your Own License (BYOL).

17.	In the Network Information section:

    a)	For the VCN use the pull-down menu to select the VCN in which you want to launch the VM DB system.

    b)	For the CLIENT SUBNET

    c)	The Use Network Security groups box is optional and unchecked by default

    d)	For the HOSTNAME PREFIX, enter the desired value.

    * The Hostname Prefix forms the first portion of the DB systems Host Name and will be used as part of the Fully Qualified Domain Name
    * For RAC systems, the Database service automatically appends a node number after the hostname prefix.

    e)	The HOST Domain Name, note how the Subnet DNS and VCN labels are used to auto generate the HOST DOMAIN NAME.

    f)	The Host and domain URL is auto generated and combines the hostname prefix and host domain name to display the fully qualified domain name (FQDN) for the database.

18.	If you click on the Advanced Option Link, you will see the ability to optionally select a Fault domain, Time Zone, or set Tags for the DB System.

19.	Click on Next to proceed with entering the details for the initial database

    a)	For the Database Name field enter the desired database name  

    b)	For the Database Unique Name Suffix enter the desired value


    * Note that the Database Unique Name is the combination of the DB Name and the DB Unique Name Suffix

20.	Let’s explore the available database images by clicking on the Change Database Image Button

    * You are able to choose between Oracle Database Software Images and Custom Database Software Images

21.	Click on the Select Button to proceed with configuring the database details

    a) For the Pluggable Database Name enter the desired value

    b) Next enter the Administrator Credentials

    c) Ensure that the Use Administrator password for the TDE wallet box is checked if you want to Use of Oracle Managed Keys

    d) For the Database Workload Type you can choose between Transaction Processing and Data Warehouse

      * Choose the type that best aligns with your application

    e) Enable Automatic  Backups is selected by default
      *	You can select the backup retention period
      *	Specify the Backup Scheduling window
      *	Uncheck the Enable Automatic Backups box if you want to configure it after he database is provisioned

22.	If you click on the Advanced Options link, you will find 3 tabs with options to fine tune the planned database configuration

    a)	The Management Tab allows you to change the Database Character Set and the National Character Set

    b)	The Encryption Tab allows you to choose between using Oracle Managed Keys and Customer Managed Keys

    c)	The Tags Tab allows you to set tags, that allows you to organize and track resources within your tenancy.

23.	Click on the Create DB System button to launch the Create DB System workflow

Congratulations on accomplishing the mission to create your Enterprise Database VM DB System.
