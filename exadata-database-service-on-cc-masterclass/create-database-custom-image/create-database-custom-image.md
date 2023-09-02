# Create Application and Database Custom Image using OCI Console


## Introduction

This lab walks you through creating Application and Database Custom Image using the OCI Console. 
 
  * **Database software images** are resources containing Oracle Database software used to provision and patch Oracle Databases and Oracle Database Homes.
  * **Database software images** are either **Oracle-published software releases** or **custom software images you create**.
  * **Custom Database Software Images** include specified patches and updates that meet your organization's standards.

Estimated Time: 10 minutes

Watch the video below for a quick walk-through of the lab.
  [Create a Custom Database Software Image](youtube:jwxxIih3brQ)

### Objectives

-   After completing this lab, you should be able to create application and database custom image using the OCI Console.


### Prerequisites

This lab requires the completion of the following:

* Completion of **Lab1**

## Task 1: Create Application Custom Image using OCI Console

1. Open the navigation menu and click Compute. Under Compute, click Instances.

  ![Naviage OCI Compute](./images/navigate-compute-instance.png" ")

2. Select your ***Assigned Compartment*** and Click **Create instance**.

  ![Create Instance](./images/click-create-instance.png" ")

3. Provide a name for the instance. For this lab, use ***MyAppServer*** for the Instance name.

4. For the **Create in compartment** Select your ***Assigned Compartment***.

5. In the **Placement section**, select ***AD 1***

6. In the **Image and shape** section, choose the image and shape for the instance:

7. In the Networking section, configure the network details for the instance:

      * Select the ***existing virtual cloud network*** option

   Make the following selections:

      * Virtual cloud network: The cloud network to create the instance in.

      * Subnet: A subnet within the cloud network that the instance is attached to. The subnets are either public or private. Private means the instances in that subnet can't have public IP addresses.

8. In the **Add SSH keys** section, generate an SSH key pair or upload your own public key.

9. In the **Boot volume** section, configure the size and encryption options for the instance's boot volume.

      * For this lab, You can accept the default value.

10. Click **Create**.

## Task 2: Create Custom Database Software Image using OCI Console

1. Open the navigation menu. Under **Oracle Database**, click **Exadata Cloud@Customer**.

2. Under **Resources**, click **Database Software Images**.

3. Click **Create Database Software Image**.

    ![Create Custom Database Software Image](./images/create-custom-dbsw.png " ")

4. In the **Display name** field, provide a display name for your image.
   
5. Choose your assigned **Compartment**.

6. Choose the **Database version** for your image. For this workshop, select the **19c** version.

7. Choose the **patch set update, proactive bundle patch, or release update**. For this workshop, choose **19.11.0.0**

8. Click **Create Database Software Image**.

    ![Create Custom Database Software Image Dialog Page](./images/create-dbsw-page.png " ")

You may now **proceed to the next lab**. 

<!--
## Learn More

* Click [here](https://docs.public.oneportal.content.oci.oraclecloud.com/en-us/iaas/exadata/doc/ecc-create-first-db.html) to learn more about Creating an Oracle Database on Exadata Database Service.

-->

## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler, Product Management

* **Contributors** - Tammy Bednar, Product Management

* **Last Updated By** - Leo Alvarado, Product Management, April 2023.
