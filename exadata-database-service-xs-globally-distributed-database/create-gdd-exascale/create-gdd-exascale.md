# Create a Globally Distributed Exadata Database on Exascale Infrastructure Resource


## Introduction

This lab guides you through the process of creating a Globally Distributed Exadata Database on Exascale Infrastructure (Distributed ExaDB-XS) in Oracle Cloud. You will configure the resource, add shards and a catalog database, and set all required networking, security, and advanced options.
 

**Estimated Time:** ***2 Hours 10 minutes***

Watch the video below for a quick walk-through of the lab.
  [Create a Custom Database Software Image](youtube:ggh0pIuPj2g)

### Objectives

-   After completing this lab, you should be able to Create a Globally Distributed Exadata Database on Exascale Infrastructure Resource using the OCI Console.


### Prerequisites

This lab requires completion of the following:

* Successful Login to a Tenancy with a service limit assigned for the **Oracle Exadata Database Service on Exascale Infrastructure**

## Task 1: (***Pre-Created for this Lab***) Review the Exadata Database Service on Exascale Infrastructure Resources

1. Open the navigation menu. Under **Oracle Database**, click **Exadata Database Service on Exascale Infrastructure**.

  ![Navigate to Exadata Database Service on Exascale Infrastructure](./images/console-to-exadb-xs.png" ")

2. In the left rail, **VM Clusters** is selected by default. In the **Applied filters**, Select ***US East (Ashburn)*** for the region and ***gdd_clusters*** for the compartment. Click the **Create VM Cluster** button. 
  
  ![Click Create VM Cluster](./images/click-create-vm-cluster.png" ")
    
    This causes the **Create VM Cluster** page to be displayed.  

3. **Provide the basic information to configure the VM cluster** in an Oracle Exadata Database Service on Exascale Infrastructure.

    * For **Compartment**: Ensure that the compartment that you want the VM Cluster to be created in is displayed.

    * Enter the **Display Name** for the VM Cluster 

    * Enter the **Cluster Name** 

    * For **Availability Domain**: Select the availability domain from the displayed options available. 

 ![Provide Basic VM Cluster Info](./images/provide-basic-vm-cluster-info-exascale.png" ")

4. **To Configure the VM cluster, provide the following information:** 
    * For the **Number of VMs in the cluster**: ***Enter 1***
    * For **ECPUs enabled per VM**: ***Enter 8***

    ![Configure VM Cluster](./images/configure-vm-cluster-exascale.png" ")

    > **Note**: It is recommended that you use one VM cluster per database (shard or catalog). One shard database and a catalog database can be co-located on a given VM cluster. However, using a common VM cluster for both the catalog and shard has the potential to cause a processing bottleneck. Create single node clusters. Only single node clusters are supported.

    * ***Reserve 4 additonal ECPUs*** by clicking on **Reserve additional ECPU to increase link** and entering the following:   
        * For **Total ECPUs per VM:** Provide a total number of ECPUs to allocate per VM. ***Enter 12***.  
        * The **Additional ECPUs reserved per VM** field which is (read only) will now indicate that there are now **4 reserved ECPUs per VM**. 
    * The **Memory per VM (GB)** field which is (read only) will display the amount of memory allocated to each VM. <br/> 
    ***Memory is calculated based on 2.75 GB per total ECPU***. 

    ![Configure VM Cluster](./images/configure-vm-cluster-reserve-ecpu.png" ")

    Click on **Save**

    * For the **Storage type**: Select ***Exascale smart storage***

    * Enter the **VM file system storage** capacity per VM (GB)

      **Note:**  The VM Filesystems storage includes /u02 capacity, where your Database Homes will go, along with all of the other VM filesystems (/, /boot, /tmp, /var, /var/log, /var/log/audit, /home, swap, kdump, /u01, grid, /u02). Any extra capacity selected beyond system minimums will go into /u02. 
    
    ![Configure VM Cluster](./images/configure-storage.png" ")

  

5. **Enter Configuration Details for Exascale Database Storage Vault:** 
    * Select **Create new vault**. 

    **For a new vault, specify the following:** 
    * For the **Exascale Vault name:** enter ***MyDemoStorageVault*** . 
    * For the **Storage Capacity for Databases (GB):** ***enter 300***. 

  ![Configure Exascale Storage Vault](./images/configure-storage-vault.png" ")

    For **Storage auto scaling**, ensure the ***Storage auto scaling toggle switch*** is turned on. By default, the **Storage auto scaling** is on.  
   
    Specify the desired **Auto scaling limit in GB**.

    > **Note:** Users must define an auto scaling limit. By default, the auto scaling limit is set to 10% above the allocated storage vault size.

    ![Configure Exascale Storage Vault](./images/configure-auto-scale-storage.png" ")

    With auto scaling enabled, if the system detects that vault's free space is less than or equal to 5% of allocated storage capacity, it automatically expands the vault capacity in increments of 10% (of the allocated storage) until the user-defined auto scaling limit is reached.

6. **Select the Oracle Grid Infrastructure version and add SSH key:** 
    * **Grid Infrastructure Release and Version fields:** display the Oracle Grid Infrastructure versions available for deployment in the VM cluster. <br/>
    ***Accept the default values for the 26ai release***.

    * **Add your SSH Key for future access to your VMs**. 
      
        <u>Choose from:</u>

        * **Generate SSH key pair**(Default option) Select this option to generate an SSH keypair. Then in the dialog below click Save private key to download the key, and optionally click Save public key to download the key. 
        * **Upload SSH key files**: Select this option to browse or drag and drop .pub files. 
        * **Paste SSH keys:** Select this option to paste in individual public keys.

  ![Configure Grid Infrastructure and SSH access](./images/configure-gi-ssh.png" ")
 

7. **To Configure the network settings, Select VCN and select Client and Backup subnet** 
    * **For the Virtual Cloud Network (VCN):** Select the ***virtual cloud network (VCN)*** for the compartment in which you want to create the VM cluster. Click ***Change Compartment*** to select a VCN in a different compartment.
    
    * **For the Client subnet:** Select the ***client subnet*** in the compartment. This is the subnet to which the VM cluster should attach. Click ***Change Compartment*** to select a subnet in a different compartment.
    
    * **For the Backup Subnet:** Select the subnet to use for the ***backup network***, which is typically used to transport backup information to and from the Backup Destination, and for Data Guard replication. Click ***Change Compartment*** to select a subnet in a different compartment, if applicable.
    
    * **For the Hostname Prefix:** Enter the hostname

  ![Configure Network Settings](./images/configure-network-settings.png" ")

8. **Select license type & choose opt-in choices for Diagnostic & Collections options.**
    * **Choose a license type:** The type of license that you want to use for the VM cluster. Your choice affects metering for billing. Select the ***Bring Your Own License (BYOL)*** OR ***License Included*** option.

  **Select Diagnostic and Collections Options**

  In the Edit Diagnostics Collection Settings dialog, you can enable or disable any of the Diagnostics Collections options. By enabling diagnostics collection and notifications, Oracle Cloud Operations and you will be able to identify, investigate, track, and resolve guest VM issues quickly and effectively. ***Accept the default values***.

    * **Enable Diagnostics Events:** Allows Oracle to collect and publish critical, warning, error, and information events to me. For more information, see Overview of Database Service Events
    * **Enable Health Monitoring:** Allows Oracle to collect health metrics/events such as Oracle Database up/down, disk space usage, and so on, and share them with Oracle Cloud operations. You will also receive notification of some events. 
    * **Enable Incident logs and trace collection:** Allows Oracle to collect incident logs and traces to enable fault diagnosis and issue resolution. 
  
  ![Choose VM Cluster License Type](./images/choose-license-type.png" ")
 
  
9. Click **Create VM Cluster** to proceed with provisioning. 

## Task 2: Create a Globally Distributed Exadata Database on Exascale Infrastructure Resource

1. Navigate to the **Globally Distributed Exadata Database on Exascale Infrastructure** list page in your Oracle Cloud Console.
   
   ![Navigate to Globally Distributed Exadata Database on Exascale Infrastructure](./images/navigate-gdd.png "Navigate to Globally Distributed Exadata Database on Exascale Infrastructure")

2. Click **Create Database**.
   
   ![Create Database](./images/create-database.png "Create Database")

3. **Provide Basic Information**

    Fill in the basic configuration details for your new Distributed ExaDB-XS resource:
    - **Compartment:** Select the compartment where the resource will reside.
    - **Display name:** Enter a descriptive name for the resource. *(This can be changed later.)*
    - **Database name prefix:** Define a prefix to be added to all configured database names for easy identification.
    - **Database version:** Select ***Oracle Database 23ai*** (currently supported release).
   
   ![Provide Basic configuration details](./images/provide-basic-info.png "Provide Basic configuration details")

4. **Configure Shards**

    You can set up shards using either the **map view** or **list view**.
    - **Map View:** Click the region where you want to deploy shards, then choose **Configure Shards** to enter their settings.
    - **List View:** Input all settings directly on the Create page.
   
   ![Configure Shards](./images/configure-shards.png "Configure Shards")

    Provide the following details:
    - **Data distribution:** Only `Automated` (uses partitioning by consistent hash) is currently supported. `User managed` is not supported.
    - **Shards in region (count):** Specify the number of shards in the selected region (up to 10 during creation; more can be added later).
    - **Replication type:** Set this to `Raft`. Raft creates replication units and manages chunk assignment, movement, and workload balancing.
    - **Replication factor:** Select a factor less than the shard count—the number of replicas in a unit, including the leader and its followers.
   
   ![Configure Shards](./images/configure-shards-page.png "Configure Shards")

    - **Shards list:** 
        - Use **+ Add Shard** to add each shard.
        - Use **Edit** from the Actions menu to adjust region/cluster placement.
        - Click a VM cluster name to view its details or use **Create VM cluster** to add new clusters as needed.
        - **Recommendation:** Use one VM cluster per database (shard or catalog).
    - *For Exadata VM cluster configuration requirements/recommendations, see [Create Exadata VM Clusters on Exascale Infrastructure].*
   
   ![Configure Shards](./images/configure-shards-clusters.png "Configure Shards")
   
   Click on **Save Changes**

   ![Configure Shards](./images/configure-shards-map.png "Configure Shards")
   

5. **Configure Shard Catalog**

    Set up shard catalog settings for your distributed database topology.
    - You may use the same configuration as for shards by enabling the **Same as Shard's configuration** toggle, or disable it to customize settings for the catalog.

    Configure these settings:
    - **Region:** Select the region for the catalog database (serves as primary if Data Guard is enabled).
    - **VM cluster:** Choose the VM cluster for the catalog database.  
        - **Recommendation:** Use separate VM clusters for each database (catalog, shard, standby).
    - **Data Guard:** Enable to create an Oracle Data Guard standby for the catalog in the selected Data Guard region.
    - **Data Guard region:** Select the region where the catalog standby will reside.
    - **Data Guard VM cluster:** Select the VM cluster (in the Data Guard region) to host the standby catalog database.  
        - **Recommendation:** Use one VM cluster per database.
    - *Note: Raft replication type does not apply to the catalog. For catalog replication, use a Data Guard standby.*
   
   ![Configure Shard catalog](./images/shard-catalog.png "Configure Shard catalog")
   

6. **Configure Additional Settings**

    Provide the following advanced and security-related configurations:
    - **Create administrator credentials:** Define the ADMIN user for all shard and catalog databases.
   
   ![Create administrator credentials](./images/admin-credentials.png "Create administrator credentials")

    - **Encryption key:** Select the vault and key created in **Task 5. Configure Security Resources** (from previous environment setup).
    - **Select private endpoint:** Choose the private endpoint created for Distributed ExaDB-XS (from your network configuration setup).
   
   ![Configure encryption key](./images/encryption-key.png "Configure encryption key")

    - **Select character sets:** Choose character sets for all databases.  
        - **Recommendation:** AL32UTF8 (Character set), AL16UTF16 (National character set).
    - **Select ports:** Enter the GSM listener port, ONS port (local), and ONS port (remote).  
        - *Each remote ONS port must be unique for each distributed database.*
   
   ![Configure character sets and ports](./images/character-sets-and-ports.png "Configure character sets and ports")

    - **Advanced options: Chunks:** Optionally configure the number of chunks per shard.
    - **Advanced options: Replication unit:** View the number of Raft replication units. Each unit contains a set of chunks and has a leader and replicas distributed across shards.
    - **Advanced options: Backups:** Enable and schedule automated database backups. See Exadata Database Service on Exascale Infrastructure documentation for backup options.
    - **Advanced options: Tags:** Optionally add tags for resource management (these can be added post-creation as well).

7. **Validate and Create the Resource**
    - Click **Validate** to run system checks against your configuration.
   
   ![Click on Validate](./images/validate.png "Click on Validate")

    - Address any validation errors, if present, and re-run validation as needed.
   
   ![Validate Successful](./images/validate-successful.png "Validate Successful")

  

8. **Provision the Distributed ExaDB-XS Resource**
    - When validation is successful, click **Create** to begin provisioning.
   
   ![Click on Create](./images/click-create.png "Click on Create")

    - **Note:** Creation may take some time as tasks such as compute allocation, software installation, and certificate generation are performed.
    - You can monitor progress via the **State** column or by clicking the resource’s display name and viewing the **Work requests** tab.
   
   ![Provisioning state](./images/gdd-provisioning-state.png "Provisioning state")

   ![Provisioning state](./images/create-database-complete.png "Provisioning state")

    - Creation is complete when all shards show as "Available" on the **Shards** tab.
   
   ![Provisioning state](./images/create-shards-successful.png "Provisioning state")


> **Important Notes and Cautions:**
- **Do not move any vaults or keys** after creating a Distributed ExaDB-XS resource. Moving them will disrupt the functioning of the resource.
- For optimal deployment, use one VM cluster per database (shard, catalog, or standby).
- Each remote ONS port number must be unique across Globally Distributed Databases unless you have deleted the previous database entirely.

## Task 3: Deploy a Globally Distributed Exadata Database on Exascale Infrastructure

This lab guides you through deploying your configured Globally Distributed Exadata Database on Exascale Infrastructure (Distributed ExaDB-XS). Deployment should be performed when your initial configuration is complete or after making changes, such as adding or removing a shard.

**Prerequisites**

- You have already created and configured the Distributed ExaDB-XS resource and any desired shards or configuration changes.

> **Note:**  
> You must deploy the Distributed ExaDB-XS within 7 days of completing the initial configuration or adding shards. Failure to deploy within this window requires you to terminate resources and start again.


1. In the **Globally Distributed Exadata Database on Exascale Infrastructure**  page. Select the Distributed ExaDB-XS you are ready to deploy.
   
2. On the details page for the selected resource, choose **Configure Sharding**.
   
   ![Click configure sharding](./images/configure-sharding-click.png "Click configure sharding")

   ***(Optional)*** **Rebalance Shards:**

   ![rebalance option](./images/shard-rebalance.png "rebalance option")
   
   If this is not the initial deployment (i.e., you have added or removed shards), you can select **Data rebalance**.
   
   Rebalancing automatically redistributes data across the configured shards for Automated Sharding type.

3. Select **Configure Sharding** to begin the deployment process.
   
   ![Click configure sharding](./images/confirm-configure-sharding.png "Click configure sharding")

   ![configure distributed sharding status](./images/configure-distributed-sharding.png "configure distributed sharding status")

   Monitor the deployment status on the resource details page. Ensure that all validation steps in configuration have been completed before deployment. 

   ![configure distributed sharding status](./images/configure-shard-available.png "configure distributed sharding status")

   If deployment is not performed within the 7-day window after configuring or modifying shards, resources must be deleted and recreated.






   

## Task 4: Discover the Globally Distributed Exadata Database on Exascale Infrastructure Resource 

1. Navigate to Distributed ExaDB-XS.
   
2. Review environment details such as region, shard count, and replication type.
   
3. Use the Actions Menu to view configuration details and settings.
   
4. Understand preconfigured prerequisites for the Global Distributed Database environment

    
***!!! Congratulations:*** You may now **proceed to the next lab**. 


## Learn More

* Click [here](https://docs.oracle.com/en-us/iaas/exadb-xs/doc/manage-vm-clusters.html) to learn more about managing the VM clusters on the Exadata Database Service on Exascale Infrastructure.

## Acknowledgements

* **Author** - Leo Alvarado, Deeksha Shrivastava, Shefali Bhargava,  Product Management, Product Management
  
* **Last Updated By** - Leo Alvarado, Product Management, Nov 2025.
