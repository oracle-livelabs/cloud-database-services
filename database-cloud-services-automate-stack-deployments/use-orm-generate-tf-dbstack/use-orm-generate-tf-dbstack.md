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

3. Click **Create stack**.

4. On the **Create stack** page, under **Choose the origin of the Terraform configuration**, select **Existing compartment**.

5. Select your assigned **compartment** and assigned **region** containing the Exadata Database Service on Cloud@Customer Resource Model.

    ![select compartment for resource discovery](./images/orm-create-stack-from-compartment.png " ")

   This will create a stack that captures resources from the selected assigned compartment using **OCI Resource Manager (resource discovery)**

6. Filter for the specific services supported for resource discovery, select **Selected**, and then select  **database** service. 
   
7. Select your assigned **compartment** where you want to create the stack.
   
    >**Note:** For this lab, you can use **MyTFBaseline-Database** for the name of your discovered database stack.

    ![Select compartment to create stack](./images/orm-create-stack-from-compartment.png " ")

8. Click **Next** twice. No variables are listed for the Existing compartment stack origin because no Terraform configuration exists yet.

9.  In the Review panel, verify the stack configuration.

10. Click **Create**.

    ![Create your discovered database stack](./images/orm-create-stack.png " ")

11. Once the newly created stack is available, On the **Stack details** page, next to **Terraform configuration**, click **Download**.

## Task 2: Deploy Gold Image Stack (Database and MyDesktop Application) using OCI Resource Manager and Terraform

1. Click **Create stack**.

2. On the **Create stack** page, under Choose the origin of the Terraform configuration, select My configuration.

3. Click **.Zip file** and add the revised Terraform configuration. You can either drag the file onto the dialog's control or click **Browse** and navigate to the location of the file or folder.

4. Select the compartment where you want to create the stack.

5. For Terraform version, select the version used by the Terraform configuration.

6. Click Next. In the Configure variables panel, review the variables listed from the Terraform configuration and change them as needed.

7. In the **Review** panel, verify the stack configuration.

8. Click **Create**

9. On the Stack details page, click Plan. In the Plan panel, edit the default name for the job. 
    
10. Click Plan. The plan job is created. The new job is listed under Jobs
    
11. On the Stack details page, click Apply. In the Apply panel, edit the default name for the job. 
    
12. Click Apply. The apply job is created. The new job is listed under Jobs.

<!--
## Learn More

* Click [here](https://docs.public.oneportal.content.oci.oraclecloud.com/en-us/iaas/exadata/doc/ecc-create-first-db.html) to learn more about Creating an Oracle Database on Exadata Database Service.

-->

## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler, Product Management

* **Contributors** - Tammy Bednar, Product Management

* **Last Updated By** - Leo Alvarado, Product Management, July 2023.
