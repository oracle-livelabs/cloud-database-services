


# Create Oracle Database Home on an Exadata Database Service on Dedicated Infrastructure


## Introduction

This lab walks you through the steps to Create Oracle Database Home on Exadata Database Service on Dedicated Infrastructure.


Estimated Time: 10 minutes



### Objectives

-   Create Oracle Database Home on Exadata Database Service on Dedicated Infrastructure


### Prerequisites

This lab requires completion of the following:

* Completion of Lab 3: Create a Cloud VM Cluster resource section.
* To launch the system, a correctly configured virtual cloud network (VCN). Its related networking resources (gateways, route tables, security lists, DNS, and so on) must also be configured as necessary for the system.
* The right IAM policy is required to proceed. See [Required IAM Policy for Exadata Cloud Infrastructure](https://docs.oracle.com/en-us/iaas/exadatacloud/exacs/preparing-for-ecc-deployment.html#GUID-EA03F7BC-7D8E-4177-AFF4-615F71C390CD).





## Task 1: Create Oracle Database Home


1. Click the navigation menu Click **Oracle Database**, then click **Exadata on Oracle Public Cloud**.

    ![Exadata on Oracle Public Cloud Menu](./images/exadb-d-menu.png " ")

2. Choose your **Compartment**

    ![Choose your Compartment](./images/choose-compartment.png " ")


3. Navigate to the cloud VM cluster or DB system you want to create the new Database Home on:

    Under **Oracle Exadata Database Service on Dedicated Infrastructure**, Click **Exadata VM Clusters**. In the list of VM clusters, find the VM cluster you want to access and click its highlighted name to view the details page for the cluster.

    ![Exadata VM Clusters](./images/exavmclusters.png " ")

4. Under Resources, click Database Homes. A list of Database Homes is displayed.

    ![Database Homes](./images/dbhomelist.png " ")

5. Click Create Database Home.

    ![Create Database Home](./images/create-dbhome.png " ")

6. In the **Create Database Home** dialog, enter the following:

    **Database Home display name**: The display name for the Database Home. Avoid entering confidential information.

    ![Database Home display name](./images/dbhome-display-name.png " ")

    **Database image**: Determines what Oracle Database version is used for the database.

    Click **Change Database Image** to use an older Oracle-published image or a custom database software image that you have created in advance, then select an Image Type:

    ![Change Database Image](./images/change-db-image.png " ")



    * **Oracle Database Software images**: These images contain generally available versions of Oracle Database software.

    * **Custom Database Software images**: These images are created by your organization and contain customized configurations of software updates and patches.


    ![Choose Database Software Image](./images/choose-db-software-image.png " ")

    While provisioning, if you opt to use **Oracle Provided Database Software Images** as the image type, then you can use the **Display all available versions** switch to choose from all available PSUs and RUs. The most recent release for each major version is indicated with a "**(latest)**" label.

    For the Oracle Database major version releases available in Oracle Cloud Infrastructure, images are provided for the current version plus the three most recent older versions (N through N - 3). For example, if an instance is using Oracle Database 19c, and the latest version of 19c offered is 19.8.0.0.0, images available for provisioning are for versions 19.8.0.0.0, 19.7.0.0, 19.6.0.0 and 19.5.0.0.

    ![Display all available versions](./images/choose-display-all-db-sw-images.png " ")


    After choosing a software image, click **Select**.

    ![Select Database Software Image](./images/select-db-software-image.png " ")

    Click **Show Advanced Options** to specify advanced options for the Database Home.

       **Tags**: If you have permission to create a resource, you also have permission to apply free-form tags to that resource. To apply a defined tag, you must have permission to use the tag namespace.

       ![Advanced Options](./images/advanced-options.png " ")

7. Click **Create**

   ![Click Create DB Home](./images/click-create-dbhome.png " ")


   When the Database Home creation is complete, the status changes from **Provisioning** to **Available**.

   ![Provisioning State](./images/provisioning-state.png " ")

   ![Available State](./images/available-state.png " ")


You may now **proceed to the next lab**.

## Additional Task (Optional): Create Custom Database Software Image


1. Click the navigation menu Click **Oracle Database**, then click **Exadata on Oracle Public Cloud**.

    ![Exadata on Oracle Public Cloud Menu](./images/exadb-d-menu.png " ")

2. Under **Resources**, click **Database Software images**.

    ![Database Software Images](./images/db-software-images.png " ")

3. Click **Create Database Software Image**.

    ![Create Database Software Images](./images/create-db-sw-images.png " ")

4. In the **Display name** field, provide a display name for your image. Avoid entering confidential information.

    ![Display Name](./images/db-sw-image-display-name.png " ")

    Choose your **Compartment**.

    Choose a **Shape family**. A custom database software image is compatible with only one shape family. Available shape families are
    the following:

       * Virtual Machine and Bare Metal Shapes
       * Exadata Shapes

5. Choose the **Database version** for your image. You can create a database software image using any supported Oracle Database release
    update (RU).

    ![Database Version](./images/dbversion.png " ")

6. Choose the **patch set update, proactive bundle patch, or release update**.

    ![Patch set update, Proactive bundle patch, release update](./images/psu.png " ")

       * *Optionally*, you can enter a comma-separated list of one-off (interim) patch numbers.

       * *Optionally*, you can upload an Oracle Home inventory file from an existing Oracle Database.

    ![One-off (interim) patch numbers, Oracle Home inventory file](./images/interim-one-off-patch.png " ")

7. Click Create Database Software Image.

    ![Create Database Software Image](./images/create-dbsw-image.png " ")


## Learn More

Click [here](https://docs.oracle.com/en-us/iaas/exadatacloud/exacs/ecs-manage-dbhomes.html) for Managing Oracle Database Homes documentation on an Exadata Cloud Infrastructure Instance.


## Acknowledgements

* **Author** - Leo Alvarado, Product Management

* **Contributors** - Tammy Bednar, Eddie Ambler, Product Management

* **Last Update** - July 2022.
