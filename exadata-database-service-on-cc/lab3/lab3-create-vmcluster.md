
# Create a VM Cluster Resource for Exadata Database Service on Cloud@Customer


## Introduction

This lab walks you through the steps to create a VM Cluster Resource for Exadata Database Service on Cloud@Customer

Estimated Lab Time: 15 minutes (VM Cluster provisioning might take approximately 4hrs)

Watch the video below for a quick walk-through of the lab.
[Create a VM Cluster Resource for Exadata Database Service on Cloud@Customer](youtube:5gaKF1ewyRg)

### Objectives

-   Create a VM Cluster Resource for Exadata Database Service on Cloud@Customer


### Prerequisites

This lab requires completion of the following:

* Completion of Lab2

## Task 1: Create a VM Cluster Resource for Exadata Database Service on Cloud@Customer

1. Open the navigation menu. Under **Oracle Database**, click **Exadata Database Service on Cloud@Customer**.

2. Choose the **Region** that contains the Exadata infrastructure for which you want to create a VM cluster.

3. Click **VM Clusters**.

4. Click **Create VM Cluster**.

5. Provide the requested information on the Create VM Cluster page:

    * **Choose a compartment**. Choose the compartment that you want to contain the VM cluster.

    * **Provide the display name**. The display name is a name that you can use to identify the VM cluster.

    * **Select Exadata Database Service on Cloud@Customer Infrastructure**. From the list, choose the Exadata infrastructure to host the VM cluster.

    * **Select a VM Cluster Network**. Choose a VM cluster network definition to use for the VM cluster. You must have an available and validated VM cluster network before you can create a VM cluster.

    * **Choose the Oracle Grid Infrastructure version**. Choose the Oracle Grid Infrastructure release that you want to install on the VM Cluster.

    * **Configure VM Cluster**

        * Click **Select DB Servers** for VM placement to allocate VM resources.

        * On the **Select DB Servers** dialog, select a minimum of two database servers for VM placement. Maximum resources available for allocation per VM are based on the number of database servers selected.

        * Click **Save Changes**.

    * **Specify the OCPU count per VM:**. Specify the OCPU count for each individual VM.

    * **Requested OCPU count for the VM Cluster:** Displays the total number of CPU cores allocated to the VM cluster based on the value you specified in the Specify the OCPU count per VM field.

    * **Specify the memory per VM (GB):** Specify the memory for each individual VM

    * **Requested memory for the VM Cluster (GB):** Displays the total amount of memory allocated to the VM cluster based on the value you specified in the Specify the memory per VM (GB) field.

    * **Specify the local file system size per VM (GB):** Specify the local file system size for each individual VM.

    * **Reserved local storage per VM (GB):** Displays the local storage size reserved internally for root file systems, Oracle Grid Infrastructure Homes, and diagnostic logs.

    * **Configure the Exadata Storage:**

        * **Specify Usable Exadata Storage:** Specify the size for each individual VM.

        * **Allocate Storage for Exadata Snapshots:** Check this option to create a sparse disk group, which is required to support Exadata snapshot functionality.

        * **Allocate Storage for Local Backups:** Check this option to configure the Exadata storage to enable local database backups.

    * **Add SSH Key:** Specify the public key portion of an SSH key pair that you want to use to access the VM cluster virtual machines.

    * **Choose a license type:**

        * **Bring Your Own License (BYOL):** Select this option if your organization already owns Oracle Database software licenses that you want to use on the VM cluster.
        * **License Included:** Select this option to subscribe to Oracle Database software licenses as part of Exadata Database Service on Cloud@Customer.

    * Enable **Diagnostics Collection** By enabling diagnostics collection and notifications, Oracle Cloud Operations and you will be able to identify, investigate, track, and resolve guest VM issues quickly and effectively.

        * **Enable Diagnostic Events:** Allow Oracle to collect and publish critical, warning, error, and information events to me.

        * **Enable Health Monitoring:** Allow Oracle to collect health metrics/events such as Oracle Database up/down, disk space usage, and more

        * **Enable Incident Logs and Trace Collection:** Allow Oracle to collect incident logs and traces to enable fault diagnosis and issue resolution.
          All three checkboxes are selected by default. You can leave the default settings as is or clear the checkboxes as needed.

            * **Enabled:** When you choose to collect diagnostics, health metrics, incident logs, and trace files (all three options).

            * **Disabled:** When you choose not to collect diagnostics, health metrics, incident logs, and trace files (all three options).

            * **Partially Enabled:** When you choose to collect diagnostics, health metrics, incident logs, and trace files ( one or two options).

      * **Show Advanced Options:**

        * **Time zone:** The default time zone for the Exadata Infrastructure is UTC, but you can specify a different time zone.

        * **Tags:** Optionally, you can apply tags.

6. Click **Create VM Cluster.**



You may now **proceed to the next lab**



## Want to Learn More?

Click [here](https://docs.public.oneportal.content.oci.oraclecloud.com/en-us/iaas/exadata/doc/ecc-first-vm-cluster.html) to learn more about Creating VM Cluster Resource for Exadata Database Service on Cloud@Customer.

## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler, Product Management

* **Contributors** - Tammy Bednar, Product Management

* **Last Update** - Feb 2023.
