


# Scale Exascale Storage Vault Resources


## Introduction

This lab walks you through the steps to Scale the Exascale Storage Vault Resources using the OCI Console.

**Estimated Time:** ***10 minutes***


### Objectives

-   After completing this lab, you should be able to scale the Exascale Storage Vault Resources using the OCI Console.
-   List Exascale Storage Vault configuration using ***OCI CLI***.


### Prerequisites

This lab requires the completion of the following:

* Completion of **Lab1**


## Task 1: Scale an Existing Exascale Storage Vault


1. Navigate to the Exascale VM Cluster page. In the **VM Cluster information** tab, under the **Exascale database storage** section, click on the **Exascale database storage:** ***MyDemoStorageVault***.
   
   ![Image showing scale Exascale storage vault](./images/navigate-storage-vault.png "Image showing scale storage vault")
     
2. In the **Exascale Storage Vault details** page, click ***Scale Storage Vault***.

   ![Image showing scale Exascale storage vault](./images/scale-storage-vault.png "Image showing scale storage vault")

3. On the **Scale Storage Vault** page, enter a value for the desired storage capacity for databases. This number should be the value for the total storage that you want to have provisioned after the scaling operation completes.
   
   For this lab, enter the value of ***400*** for the ***Storage capacity for Databases (GB)***, as we will scale up the Exascale Database Storage Vault from **300 GB to 400 GB**.

   ![Image showing scale Exascale storage vault](./images/scale-storage-vault-page-before.png "Image showing scale storage vault")

   Click ***Scale***.

   The **Exascale Storage Vault details** page is now displayed. While the scale storage vault process is running, the lifecycle state of the Exascale storage vault shows ***UPDATING***.

   ![Image showing scale Exascale storage vault](./images/scale-vault-updating.png "Image showing scale storage vault")

   When the scale storage vault process completes, the state of the Exascale storage vault changes to ***AVAILABLE***.

   ![Image showing scale Exascale storage vault](./images/scale-vault-available.png "Image showing scale storage vault")

   The **Exascale Storage Vault information** page displays information about the new allocated Exascale database storage.

4. In the Exascale Storage Vault Details page, Copy the Storage Vault OCID by clicking the ***copy*** button in the **OCID** field under the General Information section. 
   
   Paste the copied ***Exascale Storage Vault OCID*** to a text editor.

   ![copy storage vault ocid](./images/storage-vault-copy-ocid.png "copy storage vault ocid")

## Task 2: List Exascale Storage Vault Configuration using CLI

   >**Note:** To use **OCI CLI** for this lab, we will be using the ***OCI Cloud Shell tool***. 

1. Click the **Developer tools** icon in the console header and select ***Cloud Shell*** from the drop-down menu. 
   
   ![navigate to oci cloudshell](./images/cloudshell.png "navigate to oci cloudshell")

   This displays the Cloud Shell in a **drawer** at the bottom of the console:

   ![oci cloudshell launch](./images/cloudshelllaunch.png "oci cloudshell launch")

2. Run the OCI CLI Command to get the Exascale Storage Vault Configuration.

      >**Note:** Replace ***{ExascaleVaultID}*** with the Exascale Storage Vault OCID copied from *(Task 1 Step 4)*

    ```
    <copy>

      oci db exascale-db-storage-vault get --exascale-db-storage-vault-id {ExascaleVaultID}

    </copy>
    ```

   **<u>Description:</u>** 

   The OCI CLI command syntax is: **oci** ***db*** ***exascale-db-storage-vault*** ***get*** ***--exascale-db-storage-vault-id*** ***{ExascaleVaultID}***

   **<u>Where:</u>**

      * ***db*** is the **service type** for the Oracle Database Cloud Services.
      * ***exascale-db-storage-vault*** is the **resource type** for the Exascale Storage Vault.
      * ***get*** is the **action** to get information about the Exascale Storage Vault Configuration.
      * ***--exascale-db-storage-vault-id*** is the **parameter** for the Exascale Storage Vault OCID.

   After running the command, you will see similar output below.

   ![show storage vault details](./images/get-storage-vault-details.png "show storage vault details")

   The output of the command displays information about the configuration of the selected  ***Exascale Storage Vault***, such as:

      * ***Storage Vault Display Name***
      * ***Exascale Database Storage Capacity Available size in gbs***
      * ***Exascale Database Storage Capacity Total size in gbs***
      * ***Lifecycle state***
      * ***Exascale Storage Vault Associated VM Cluster Count and OCID***


***Congratulations!!!*** You may now **proceed to the next lab**.

## Acknowledgements

* **Author** - Leo Alvarado, Bob Thome, Christian Craft, Seth Miller  Product Management

* **Last Updated By** - Leo Alvarado, Product Management, Aug 2025.
