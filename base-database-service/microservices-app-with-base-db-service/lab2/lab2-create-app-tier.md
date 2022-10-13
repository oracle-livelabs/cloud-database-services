# Create The Application Tier


## Introduction

This lab walks you through the steps to Create The Application Tier.

Estimated Time: 15 minutes




### Objectives

-   Create Application Tier using Oracle Cloud Compute Service.

### Prerequisites

This lab requires completion of the following:

* Setting Up Your Tenancy - After Oracle creates your tenancy in OCI, an administrator at your company will need to perform some setup tasks and establish an organizational plan for your cloud resources and users.




## Task 1: Create Application Tier

**(For this lab, The Application Tier is pre-provisioned - Informational Instructions ONLY)**

1. Open the navigation menu and click Compute. Under Compute, click Instances.

  ![Naviage OCI Compute](./images/navigate.oci.png" ")

2. Click Create instance.

  ![Create Instance](./images/create.instance.png" ")

3. Enter a name for the instance. You can add or change the name later. The name doesn't need to be unique because an Oracle Cloud Identifier (OCID)
   uniquely identifies the instance. Avoid entering confidential information.

   ![Create Compute](./images/create.compute.name.png" ")

4. Select the compartment to create the instance in.

   The other resources that you choose can come from different compartments.

5. In the Placement section, make the following selections:

   a. Select the Availability domain that you want to create the instance in.


6. In the Image and shape section, choose the image and shape for the instance:

   ![Change Image](./images/change.image.png" ")

      a. Select Oracle images: Pre-built Oracle enterprise images and solutions enabled for Oracle Cloud Infrastructure.

   ![Select Image](./images/select.image.png" ")

      * For this lab, we will be using **Oracle Linux Cloud Developer Image**.

      b. In the Shape section, click Change shape and select AMD and choose Flexible shapes

   ![Select Shape](./images/select.shape.png" ")

7. In the Networking section, configure the network details for the instance:

      * Select the *"existing virtual cloud network"* option

   Make the following selections:

      * Virtual cloud network: The cloud network to create the instance in.

      * Subnet: A subnet within the cloud network that the instance is attached to. The subnets are either public or private. Private means the instances in that subnet can't have public IP addresses.

   ![Select VCN](./images/select.vcn.png" ")



8. In the Add SSH keys section, generate an SSH key pair or upload your own public key.

   ![Add SSH Keys](./images/add.ssh.keys.png" ")

9. In the Boot volume section, configure the size and encryption options for the instance's boot volume.

      * For this lab, You can accept the default value.

10. (Optional) To configure advanced settings, click Show advanced options.

11. Click Create.

   ![Create Instance](./images/create.compute.png" ")

   For this lab, the application tier is pre-provisioned with the following software requirements.

    * [Micronaut 3.4](https://micronaut.io/download/).
    * [GraalVM 22.0.0.2 for JDK 11](https://www.graalvm.org/docs/getting-started/)
    * An IDE such as [VS Code](https://code.visualstudio.com/)

Let's proceed with connecting to the application tier.

## Task 2: Connect to Application Tier using No-VNC Desktop

1. **Click** on **View Login Info**, and Click on the Remote Desktop Link

  ![No VNC Link](./images/no.vnc.png" ")

  ![No VNC Link](./images/novnc.load.png" ")


You may now **proceed to the next lab**.



## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler, Product Management

* **Contributors** - Tammy Bednar, Product Management

* **Last Update** - Sep 2022.
