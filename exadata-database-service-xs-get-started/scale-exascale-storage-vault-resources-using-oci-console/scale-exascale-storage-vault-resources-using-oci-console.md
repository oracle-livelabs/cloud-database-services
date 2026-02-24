


# Scale Exascale Storage Vault Resources


## Introduction

This lab walks you through the steps to Scale the Exascale Storage Vault Resources using the OCI Console.

**Estimated Time:** ***10 minutes***


### Objectives

-   After completing this lab, you should be able to scale the Exascale Storage Vault Resources using the OCI Console.


### Prerequisites

This lab requires the completion of the following:

* Completion of **Lab1**


## Task 1: Scale an Existing Exascale Storage Vault


1. Navigate to your Exascale VM Cluster page. In the **VM Cluster information** tab, under the **Exascale database storage** section, click on the **Exascale database storage:** for example, ***MyDemoStorageVault***.
   
   ![Image showing scale Exascale storage vault](./images/navigate-storage-vault.png "Image showing scale storage vault")
     
2. In the **Exascale Storage Vault details** page, click ***Scale Storage Vault***.

   ![Image showing scale Exascale storage vault](./images/scale-storage-vault.png "Image showing scale storage vault")

3. On the **Scale Storage Vault** page, enter a value for the desired storage capacity for databases. This number should be the value for the total storage that you want to have provisioned after the scaling operation completes.
   
   For this lab, enter the value of ***400*** for the ***Storage capacity for Databases (GB)***, and ***800*** for the ***Auto scaling limit (GB)*** as we will scale up the Exascale Database Storage Vault from **300 GB to 400 GB** and Auto scaling limit from **700 GB to 800 GB**.

   ![Image showing scale Exascale storage vault](./images/scale-storage-vault-page-before.png "Image showing scale storage vault")

   Click ***Scale***.

   The **Exascale Storage Vault details** page is now displayed. While the scale storage vault process is running, the lifecycle state of the Exascale storage vault shows ***UPDATING***.

   ![Image showing scale Exascale storage vault](./images/scale-vault-updating.png "Image showing scale storage vault")

   When the scale storage vault process completes, the state of the Exascale storage vault changes to ***AVAILABLE***.

   ![Image showing scale Exascale storage vault](./images/scale-vault-available.png "Image showing scale storage vault")

   The **Exascale Storage Vault information** page displays information about the new allocated Exascale database storage.


***Congratulations!!!*** You may now **proceed to the next lab**.

## Learn More

* Click [here](https://docs.oracle.com/en-us/iaas/exadb-xs/doc/creating-exadb-xs-vault.html) to learn more about managing the Exascale Database Vaults on Oracle Exadata Database Service on Exascale Infrastructure.

## Acknowledgements

* **Author** - Leo Alvarado, Tammy Bednar  Product Management

* **Last Updated By** - Leo Alvarado, Product Management, Feb 2026.
