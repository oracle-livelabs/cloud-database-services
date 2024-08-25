# Use OCI Resource Manager to generate and deploy Terraform for Application and Database Stack


## Introduction

This lab walks you through the steps to generate and deploy Terraform for Application and Database stack using OCI Resource Manage.

Estimated Time: 20 minutes


### Objectives

-   After completing this lab, you should be able to generate and deploy Terraform for Application and Database stack using OCI Resource Manager.


### Prerequisites

This lab requires the completion of the following:

* Completion of **Lab1**

## Task 1: Generate Terraform baseline configuration for Database development environment using OCI Resource Manager

1. Open the navigation menu and click **Developer Services**. Under **Resource Manager**, click **Stacks**.
   
   ![Launch ORM Stacks](./images/oci-menu-orm.png " ")

2. On the **Stacks** page, select your assigned compartment.

3. Click ***Create stack***.

4. On the **Create stack** page, under **Choose the origin of the Terraform configuration**, select ***Existing compartment***.

5. Select your ***assigned compartment*** and assigned **region** containing the Exadata Database Service on Exascale Infrastructure.

    ![select compartment for resource discovery](./images/orm-create-stack-from-compartment.png " ")

   This will create a stack that captures resources from the selected assigned compartment using **OCI Resource Manager (resource discovery)**

6. Select the service types that you want to be discovered for your terraform script by: Selecting ***Selected*** for the Terraform provider services and then selecting ***database*** for the services value. 
   
    ![Select compartment to create stack](./images/orm-discover-dbstack.png " ")
   
7. Provide the **Name** for your stack and Select the **compartment** where you want to create the stack.
   
    >**Note:** For this lab, use ***MyTFBaseline-Database*** for the name of your discovered database stack and select your ***assigned compartment*** for the **Create in compartment**

    ![Create your discovered database stack](./images/orm-create-stack.png " ")

    

8. Click **Next** twice. No variables are listed for the Existing compartment stack origin because no Terraform configuration exists yet.

9.  In the Review panel, verify the stack configuration. Take note of the Terraform version for future use on your stack deployment.

    ![Create database stack](./images/orm-create-stack-database.png " ")

10. Click **Create**.
    
    

11. Once the newly created stack is available, Download a copy of the generated Terraform script by clicking on the **Download** link next to **Terraform configuration**.

    ![Download database stack](./images/orm-download-dbstack.png " ")

    After downloading the zip file, you can unzip the file and view the generated Terraform configuration file in your text or code editor. 

    View the *database.tf* file. 

    >**Note:** Your database's generated baseline terraform code is similar to the output below. *Resources discovered in the Baseline Terraform configuration will be presented and discussed by the speakers*. Notes are added on each section of the discovered Exadata Database Service Resource Model

    This is the discovered resource for the ***Exascale Storage Vault Resource***

    ```
    <copy>


        ## This is the discovered resource for the Exascale Storage Vault Resource

    resource oci_database_exascale_db_storage_vault export_MyDemoStorageVault {
    additional_flash_cache_in_percent = "0"
    availability_domain = var.availability_domain--IBjw-US-SANJOSE-1-AD-1
    compartment_id = var.compartment_ocid
    description  = "MyDemoStorageVault"
    display_name = "MyDemoStorageVault"
    freeform_tags = {}
    high_capacity_database_storage {
    total_size_in_gbs = "300"
    }
    time_zone = "UTC"
    }
    
    </copy>
    ```

    This is the discovered resource for the ***Exadata VM Cluster on Exascale Infrastructure***


    ```
    <copy>


        ## This is the discovered resource for the Exadata VM Cluster Resource

    resource oci_database_exadb_vm_cluster export_MyDemoVMCluster {
    availability_domain = var.availability_domain--IBjw-US-SANJOSE-1-AD-1
    backup_network_nsg_ids = []
    backup_subnet_id = "ocid1.subnet.oc1.us-sanjose-1.xxxxxxxx"
    cluster_name     = "MyDemoClus"
    compartment_id   = var.compartment_ocid
    data_collection_options {
        is_diagnostics_events_enabled = "true"
        is_health_monitoring_enabled  = "true"
        is_incident_logs_enabled      = "true"
        }
    display_name                 = "MyDemoVMCluster"
    domain                       = "clientprivnet.mydemovcn.oraclevcn.com"
    exascale_db_storage_vault_id = oci_database_exascale_db_storage_vault.export_MyDemoStorageVault.id
    grid_image_id = "ocid1.dbpatch.oc1.us-sanjose-1.xxxxxxx"
    hostname      = "myhostvm"
    license_model = "BRING_YOUR_OWN_LICENSE"
    node_config {
        enabled_ecpu_count_per_node              = "8"
        total_ecpu_count_per_node                = "12"
        vm_file_system_storage_size_gbs_per_node = "280"
        }
    node_resource {
    node_name = "<placeholder>" 
        }
    node_resource {
    node_name = "<placeholder>" 
        }
    nsg_ids = []
    scan_listener_port_tcp     = "1521"
    scan_listener_port_tcp_ssl = "2484"
    shape                      = "EXADBXS"
    ssh_public_keys = []
    subnet_id      = "ocid1.subnet.oc1.us-sanjose-1.xxxxxxx"
    system_version = "24.1.0.0.0.240517.1"
    time_zone      = "UTC"
        
    ignore_changes = [node_resource[0].node_name, node_resource[1].node_name]
        }
    
    </copy>
    ```

    This is the discovered resource for the ***Pluggable Databases***

    ```
    <copy>


        ## This is the discovered resource for the Pluggable Databases

  resource oci_database_pluggable_database export_pluggable_database {
  #container_database_admin_password = 
  container_database_id = "ocid1.database.oc1.us-sanjose-1.xxxxxxx"
  #convert_to_regular_trigger = <<Optional value not found in discovery>>
  defined_tags = {
  }
  freeform_tags = {
  }
  #pdb_admin_password = 
  #pdb_creation_type_details = 
  pdb_name = "MYPDB01"
  #refresh_trigger = <<Optional value>>
  #rotate_key_trigger = <<Optional value>>
  #should_create_pdb_backup = <<Optional value>>
  #should_pdb_admin_account_be_locked = <<Optional value>>
  #tde_wallet_password = <<Optional value not found in discovery>>
}

    </copy>
    ```

## Task 2: Deploy Gold Image Stack (Database and MyDesktop Application) using OCI Resource Manager and Terraform

1. In the Breadcrumb link, Click on **Stacks** then select your assigned **compartment** and Click **Create stack**.

    ![Deploy App and DB Stack](./images/orm-deploy-app-dbstack.png " ")

2. On the **Create stack** page, under Choose the origin of the Terraform configuration, select ***My configuration***.

   Select ***.Zip file*** for the Terraform configuration source. then browse your desktop for a file called ***SampleTF.zip***. 
   
   
    ![Upload zip file to deploy App and DB Stack](./images/orm-deploy-app-dbstack-from-zip.png " ")


3. Provide the **Name** for your stack and select the **compartment** where you want to create the stack.

    >**Note:** For this lab, use ***MyAppDBStack*** for the name of your discovered database stack and use your assigned compartment for the **Create in compartment**

4. For Terraform version, select the *version 1.2.x*.
   
   ![Upload zip file to deploy App and DB Stack](./images/orm-create-name-stack.png " ")

5. Click **Next**. In the **Configure variables panel**, review and provide the required variables listed from the Terraform configuration.

    Provide required variable details for the **Application Server Stack**.
   
   ![Deploy Application Stack](./images/orm-deploy-application-stack.png "Deploy Application Stack")

      * For the **ApplicationServer_CompartmentOCID**, Select your ***Assigned compartment***
      * Provide the **Application Server name**. For this lab, use the name ***MyAppServer***
    
    Provide required variable details for the **Exadata Database Server Stack**.
   
   ![Deploy Database PDB Stack](./images/orm-deploy-exadata-database-pdb.png "Deploy Database PDB Stack")

      * Provide the **Developer Container Database OCID**. For this lab, use the value for the ***ContainerDatabaseOCID*** obtained from ***Lab10 Task 3***
      * Provide the ***Pluggable Database display name***. For this lab, use the name ***ThinPDB3***
      * Provide the ***Pluggable Database administrator password***
      * Provide the ***TDE Wallet Password*** 
  
    Click on **Next**

6. In the **Review** panel, verify the stack configuration and Click **Create** to establish your customized stack.
   
   ![Review App and Database Stack](./images/orm-deploy-app-db-review.png " ")

   ![App and Database Available Stack](./images/orm-myappdbstack-available.png " ")
    
7. Create Stack Deployment Plan by: Clicking on **Plan** on the Stack details page. 
   
    ![Create Stack Deployment Plan](./images/orm-plan-job.png " ")

   In the Plan panel, use ***MyAppDBStackPlan*** for the Plan name and then Click on **Plan** to proceed. 

    ![Confirm Create Stack Deployment Plan](./images/orm-click-plan.png " ")
   
    >**Note:** The plan job is created and is listed under Jobs. 

    When the Stack Deployment Plan process is completed, the state of the plan job changes to **Succeeded**.

    ![Stack Deployment Plan Succeeded](./images/orm-plan-success.png " ")
   
    
8.  In the **Breadcrumb** link, Click on **Stack details**.  

    ![View Stack Details Page ](./images/orm-plan-stackdetails.png " ")

    Process Stack Deployment Plan by clicking on **Apply**.

    ![Create Stack Deployment Apply ](./images/orm-stackdetails-apply.png " ")
    
    In the Apply panel, edit the default name for the job. For this lab, we will use ***MyAppDBStackApply*** for the Apply name. 

    Select **Automatically Approve** for the Apply job plan resolution and then Click on **Apply**. 

    ![Click Stack Deployment Apply ](./images/orm-apply-stack.png " ")
    
    >**Note:** This will cause the apply job to be created and our new Application and Database stack to be deployed once the job is completed.

    ![Stack Deployment Apply Succeeded ](./images/orm-apply-succeeded.png " ")



<!--
## Learn More

* Click [here](https://docs.public.oneportal.content.oci.oraclecloud.com/en-us/iaas/exadata/doc/ecc-create-first-db.html) to learn more about Creating an Oracle Database on Exadata Database Service.

-->

## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler, Product Management

* **Contributors** - Tammy Bednar, Product Management

* **Last Updated By** - Leo Alvarado, Product Management, August 2024.
