# Create Application Tier


## Introduction

This lab walks you through the steps to Create The Application Tier.

Estimated Time: 15 minutes




### Objectives

-   Create Application Tier using Oracle Cloud Compute Service.

### Prerequisites

This lab requires completion of the following:

* Setting Up Your Tenancy - After Oracle creates your tenancy in OCI, an administrator at your company will need to perform some setup tasks and establish an organization plan for your cloud resources and users.




## Task 1: Create Application Tier

1. Open the navigation menu and click Compute. Under Compute, click Instances.

  ![Naviage OCI Compute](./images/navigate.oci.png" ")

2. Click Create instance.

  ![Create Instance](./images/create.instance.png" ")

3. Enter a name for the instance. You can add or change the name later. The name doesn't need to be unique, because an Oracle Cloud Identifier (OCID)
   uniquely identifies the instance. Avoid entering confidential information.

   ![Create Compute](./images/create.compute.name.png" ")

4. Select the compartment to create the instance in.

   The other resources that you choose can come from different compartments.

5. In the Placement section, make the following selections:

   a. Select the Availability domain that you want to create the instance in.

   b. (Optional) If you want to choose a capacity type or specify a fault domain, click Show advanced options. The following options are available:

    * Capacity type: Select one of the following.

      * On-demand capacity: The instance is launched on a shared host using on-demand capacity. This is the default.

      * Preemptible capacity: This option lets you run the instance on a shared host using preemptible capacity. The capacity is reclaimed when it's  
        needed elsewhere, and the instances are terminated. Choose whether to permanently delete the attached boot volume when the capacity is reclaimed and the instance is terminated.

      * Capacity reservation: This option lets you count the instance against a capacity reservation. Select a capacity reservation from the list.

      * Dedicated host: This option lets you run the instance in isolation, so that it is not running on shared infrastructure. Select a dedicated virtual machine host from the list. You can only place an instance on a dedicated virtual machine host at the time you create the instance.

    * Fault domain: The fault domain to use for the instance. If you do not specify the fault domain, the system selects one for you. You can edit the fault domain after you create the instance.

6. In the Image and shape section, choose the image and shape for the instance:

   ![Change Image](./images/change.image.png" ")

   a. Select Oracle images: Pre-built Oracle enterprise images and solutions enabled for Oracle Cloud Infrastructure.

   ![Select Image](./images/select.image.png" ")

   * For this lab, we will be using **Oracle Linux Cloud Developer Image**

   b. In the Shape section, click Change shape and select AMD and choose Flexible shapes

   ![Select Shape](./images/select.shape.png" ")

7. In the Networking section, configure the network details for the instance:

   Select existing virtual cloud network

   Make the following selections:

   Virtual cloud network: The cloud network to create the instance in.

   Subnet: A subnet within the cloud network that the instance is attached to. The subnets are either public or private. Private means the instances in that subnet can't have public IP addresses.

   ![Select VCN](./images/select.vcn.png" ")

   If choosing Select existing subnet, for Subnet, select the subnet.

   If choosing Create new public subnet, enter the following information:

    * New subnet name: Avoid entering confidential information.

    * Create in compartment: The compartment where you want to put the subnet.

    * CIDR block: A single, contiguous CIDR block for the subnet (for example, 172.16.0.0/24). Make sure it's within the cloud network's CIDR block and doesn't overlap with any other subnets.

8. In the Add SSH keys section, generate an SSH key pair or upload your own public key

   ![Add SSH Keys](./images/add.ssh.keys.png" ")

9. In the Boot volume section, configure the size and encryption options for the instance's boot volume

10. (Optional) To configure advanced settings, click Show advanced options.

11. Click Create.

   ![Create Instance](./images/create.compute.png" ")

    To track the progress of the operation and troubleshoot errors that occur during instance creation, use the associated work request.

    After the instance is provisioned, details about it appear in the instance list. To view more details, including IP addresses, click the instance name.

    When the instance is fully provisioned and running, you can connect to it using SSH as described in Connecting to an Instance.

    For this lab, the application tier is pre-provisioned Let's proceed on connecting to the application tier

## Task 2: Connect to Application Tier using No-VNC Desktop

1. Go to your Reservation Information, and Click on the Remote Desktop Link

  ![No VNC Link](./images/no.vnc.png" ")

  ![No VNC Link](./images/novnc.load.png" ")


You may now **proceed to the next lab**.



## Acknowledgements

    * **Author** - Leo Alvarado, Eddie Ambler Product Management

    * **Contributors** - Tammy Bednar Product Management

    * **Last Update** - Aug 2022.
