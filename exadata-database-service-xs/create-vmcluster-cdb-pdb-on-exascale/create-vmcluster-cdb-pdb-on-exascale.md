# Create Instance of Exadata Database Service on Exascale Infrasturcture using OCI Console


## Introduction

This lab walks you through how to create an instance of the Exadata Database Service on Exascale Infrastructure using the OCI Console. 
 

Estimated Time: 2 Hours 10 minutes

Watch the video below for a quick walk-through of the lab.
  [Create a Custom Database Software Image](youtube:placeholder)

### Objectives

-   After completing this lab, you should be able to create an Exadata VM cluster and an Oracle Database on Exascale technology using the OCI Console.


### Prerequisites

This lab requires completion of the following:

* Successful Login to a Tenancy with a service limit assigned for the **Exadata Database Service on Exascale Infrastructure**

## Task 1: (***Pre-Created for OCW Session***) --> Create an Exadata VM Cluster Resource with Exadata on Exascale Cloud Infrastructure

1. Open the navigation menu. Under **Oracle Database**, click **Exadata Database Service on Exascale Infrastructure**.

  ![Navigate to Exadata Database Service on Exascale Infrastructure](./images/console-to-exadb-xs.png" ")

2. In the left rail, **VM Clusters** is selected by default. Under **List Scope**, Select your assigned compartment named ***MyCompartmentXX***. 
   
  ![Select Compartment where VM Cluster will reside](./images/select-compartment.png" ")

3. Click **Create VM Cluster** button 
    
    This causes the **Create VM Cluster** page to be displayed.  

4. **Provide the basic information to configure the Exadata VM cluster**.
    * For Compartment: Ensure that the compartment that you want the VM Cluster to be created in is displayed. It should display **your assigned compartment**.

    * For Display Name: Enter ***MyDemoVMClusterXX*** 

    * For Cluster Name: Enter ***MyDemoClus*** 

    * For Availability Domain: Select the availability domain from the displayed options available. 

 ![Provide Basic VM Cluster Info](./images/provide-basic-vm-cluster-info-exascale.png" ")

5. **To Configure the VM cluster, provide the following information:** 
    * For the number of VMs in the cluster: ***Enter 2***
    * For ECPUs enabled per VM: ***Enter 8***

    * ***Reserve 4 additonal ECPUs*** by clicking on **Reserve additional ECPU to increase link** and entering the following:   
        * For **Total ECPUs per VM:** Provide a total number of ECPUs to allocate per VM. ***Enter 12***.  
        * The **ECPUs additional reserved per VM** field which is (read only) will now indicate that there are now **4 reserved ECPUs**. 
    * The **Memory per VM (GB)** field which is (read only) will display the amount of memory allocated to each VM. <br/> 
    ***Memory is calculated based on 2.75 GB per total ECPU***. 

      <u>**Size the VM file system storage**</u>: 
    * For system storage capacity per VM (GG): ***Enter 280***

      **Note:**  The VM Filesystems storage includes /u02 capacity, where your Database Homes will go, along with all of the other VM filesystems (/, /boot, /tmp, /var, /var/log, /var/log/audit, /home, swap, kdump, /u01, grid, /u02). Any extra capacity selected beyond system minimums will go into /u02. 

  ![Configure VM Cluster](./images/configure-vm-cluster-exascale.png" ")

6. **Enter Configuration Details for Exascale Database Storage Vault:** 
    * Select **Create new vault**. 

    **For a new vault, specify the following:** 
    * For the **Exascale Vault name:** enter ***MyDemoStorageVaultXX*** . 
    * For the **Storage Capacity for Databases (GB):** ***enter 300***. 

    **Note:** The minimum size configuration for an Exascale Database Storage Vault is 300 GB. 200 GB of the space that you allocate in your Vault is reserved for a 200 GB ACFS file system. This ACFS file system resides within your Exascale Database Storage Vault, but is reserved for system use. Thus, if you provisioned the minimum of 300 GB in your Exascale Database Storage Vault, then 100 GB of that 300 GB capacity will be available storage for your databases. 

    When you create a new vault, the Provisioning status window opens to provide you with the status of vault creation, and the name of the vault that is being created in the format Vault-YYYYMMDDHHMM indicating the creation date, where YYYY is the year, MM is the month, DD is the day, HH is the hour, and Mm is the minute. 

  ![Configure Exascale Storage Vault](./images/configure-exascale-storage-vault.png" ")

7. **Select the Oracle Grid Infrastructure version and add SSH key:** 
    * **Grid Infrastructure Release and Version fields:** display the Oracle Grid Infrastructure versions available for deployment in the VM cluster. <br/>
    ***Accept the default values for the 23ai release***.

    * **Add your SSH Key for future access to your VMs**. <u>Choose from:</u>

        * **Generate SSH key pair**(Default option) Select this option to generate an SSH keypair. Then in the dialog below click Save private key to download the key, and optionally click Save public key to download the key. 
        * **Upload SSH key files**: Select this option to browse or drag and drop .pub files. 
        * **Paste SSH keys:** Select this option to paste in individual public keys.

  ![Configure Grid Infrastructure and SSH access](./images/configure-grid-infra-and-SSH-access.png" ")
 

8. **To Configure the network settings, Select VCN and select Client and Backup subnet** 
    * **For the Virtual Cloud Network (VCN):** Click Change Compartment and select compartment named ***MyDemo***.  <br/>
    Then select the Virtual Cloud Network named ***MyDemoVCN***.
    
    * **For the Client subnet:** Select the client subnet in the assigned compartment named ***MyClient-PrivateSubnetAXX***. <br/>
    
    * **For the Backup Subnet:** Click Change Compartment and select compartment named ***MyDemo***.  <br/>
    Then select the Backup Subnet named ***MyBackup-PrivateSubnet***.
    
    * **For the Hostname Prefix:** Enter ***MyHostVM***

  ![Configure Network Settings](./images/configure-network-settings.png" ")

9. **Select license type & choose opt-in choices for Diagnostic & Collections options.**
    * **Choose a license type:** The type of license that you want to use for the VM cluster. Your choice affects metering for billing. ***Select the Bring Your Own License (BYOL) option.*** 

  ![Choose VM Cluster License Type](./images/choose-license-type.png" ")

10. **Select Diagnostic and Collections Options**
In the Edit Diagnostics Collection Settings dialog, you can enable or disable any of the Diagnostics Collections options. By enabling diagnostics collection and notifications, Oracle Cloud Operations and you will be able to identify, investigate, track, and resolve guest VM issues quickly and effectively. ***Accept the default values***.
    * **Enable Diagnostics Events:** Allows Oracle to collect and publish critical, warning, error, and information events to me. For more information, see Overview of Database Service Events
    * **Enable Health Monitoring:** Allows Oracle to collect health metrics/events such as Oracle Database up/down, disk space usage, and so on, and share them with Oracle Cloud operations. You will also receive notification of some events. 
    * **Enable Incident logs and trace collection:** Allows Oracle to collect incident logs and traces to enable fault diagnosis and issue resolution. 
 
  ![Choose Diagnostic & Collections options](./images/choose-diagnostic-and-collections-options.png" ")

11. Click **Create VM Cluster** to proceed with provisioning. 




## Task 2: Create an Oracle Database on Exadata Database Service on Exascale Infrastructure using OCI Console

1. **Navigate to the Exadata Database Service on Exascale Infrastructure:** 
    * Open the navigation menu. 
    * Under **Oracle Database**, click **Exadata Database Service on Exascale Infrastructure**.

  ![Navigate to Exadata Database Service on Exascale Infrastructure](./images/console-to-exadb-xs.png" ")

2. **Navigate to the cloud VM cluster you want to create the database in:**
    * In the left rail, ensure ***VM Clusters*** is selected. 
    * Under **List Scope**, Select your assigned compartment named ***MyCompartmentXX***. 
    * Then **click on your VM Clusters** ***assigned name*** to view the **VM Cluster Details page**. 
   
  ![Select Compartment and VM Cluster where Container Database will reside](./images/select-compartment-and-vm-cluster.png" ")

3. On the **VM Cluster Details page** Click on **Create Container Database**.

  ![Create Container Database button](./images/vmc-details-pg-create-cdb-on-exascale.png " ")

4. In the **Create Container Database** page enter the **basic information for creating the container database:** 
    * For the **Database Name:** Enter ***DemoDBXX***
    * For the **Database Unique Name Suffix:** Enter ***DemoDBXX_23aiExascale01***
    * For the **Database Version:** Select ***23ai***
    * For the **Pluggable Database Name:** Enter ***MyPDBXX***

  ![Create Container Database Basic Info](./images/create-cdb-basic-info.png " ")
   
5. Specify the **Database Home Source and Administrator Credentials:**
    * For the **Database Home source** choose: **Select an Existing Database Home**
    * Select Database Home with display name of ***MyDemo23aiDBhome01***
    * Next configure your **Administrator Credentials:** by entering ***Pass4OCW24Student-#*** as the **password** for the **sys** username.
   
  ![Define DBhome and Admin Password Image](./images/define-dbhome-and-admin-pwd.png " ")

6. For this lab, we will not be enabling **Automatic Backups** for the database during the create database workflow.
    * **Uncheck the box for:** ***Enable Automatic Backups***

  ![Uncheck Enable Automatic Backups Image](./images/uncheck-enable-automatic-backups.png " ")

7. **Review & Configure Advanced Options** for the Container Database by clicking on the **Show Advanced Options** link.
    * Under the **Management tab** set the Oracle_SID to ***ExascaleDemo***  
  ![Configure Adv Options - Mgmt Tab Image](./images/configure-adv-options-mgmt-tab.png " ")
    * Under the **Encryption tab** you can select the desired key management method. Select ***Use Oracle-managed keys***.
  ![Configure Adv Options - Encryption Tab Image](./images/configure-adv-options-encrypt-tab.png " ")

    * Under the **Tags tab:** you can add free-form tags to your resource.  If you want to apply a defined tag, you must have permissions to use the tag namespace. Remember that you can also apply tags to your resources after they are provisioned.
  ![Configure Adv Options - Tags Tab Image](./images/configure-adv-options-tags-tab.png " ")

8. Click on the **Create Container Database** button to proceed with creating the Container Database.

    ![Container Database Details Page Image](./images/cdb-details-page-with-pdb.png " ")
***!!! Congratulations:*** You may now **proceed to the next lab**. 


## Learn More

* Click [here](https://docs.oracle.com/en-us/iaas/exadb-xs/doc/manage-vm-clusters.html) to learn more about managing the VM clusters on the Exadata Database Service on Exascale Infrastructure.

## Acknowledgements

* **Author** - Eddie Ambler, Leo Alvarado, Product Management

* **Contributors** - Tammy Bednar, Product Management

* **Last Updated By** - Eddie Ambler, Product Management, July 2024.
