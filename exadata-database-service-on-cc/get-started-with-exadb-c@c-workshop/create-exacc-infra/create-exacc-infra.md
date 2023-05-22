


# Create Infrastructure resource for Exadata Database Service on Cloud@Customer


## Introduction

This lab walks you through the steps to create an Infrastructure resource for Exadata Database Service on Cloud@Customer.

Estimated Lab Time: 15 minutes

Watch the video below for a quick walk-through of the lab.
[Create an Exadata Database Service on Cloud@Customer Infrastructure](youtube:DCrivNA5bs8)

### Objectives

-   After completing this lab, you should be able to create Infrastructure resource for Exadata Database Service on Cloud@Customer

### Prerequisites

This lab requires completion of the following:

* Setting Up Your Tenancy - After Oracle creates your tenancy in OCI, an administrator at your company will need to perform some setup tasks and establish an organizational plan for your cloud resources and users.

* Ensure that you have adequate Oracle Exadata Database Service Limits and OCI Service limits prior to provisioning. See [OCI Service limits](https://docs.oracle.com/en-us/iaas/Content/General/Concepts/servicelimits.htm) for more information. See [Requesting a Service Limit Increase](https://docs.oracle.com/en-us/iaas/Content/General/Concepts/servicelimits.htm#Requesti) on how to increase service resources.

* You must plan on allocating a range of IP addresses to the administration network, and another range of IP addresses to the RoCE network. When planning the IP addresses, it is important to note that no overlap with existing IP addresses in your corporate network is permitted between the address ranges for the administration network and the RoCE network. You must also allocate IP addresses from your corporate network for the Control Plane network.



## Task 1: Create Infrastructure Resource for Exadata Database Service on Cloud@Customer


1. Open the navigation menu. Under **Oracle Database**, click **Exadata Database Service on Cloud@Customer**.

2. Under **Region**, select the region that you want to associate with the Oracle Exadata infrastructure.

      * The region that is associated with your Oracle Exadata infrastructure cannot be changed after the Oracle Exadata infrastructure is created. Therefore, ensure that you select the most appropriate region for your infrastructure.

3. Click **Exadata Infrastructure**.

4. Click **Create Exadata Infrastructure**.

5. In the Create Exadata Infrastructure page, provide the requested information:

    * **Choose the Oracle Cloud Infrastructure region:** The region that is associated with your Oracle Exadata infrastructure cannot be changed after the Oracle Exadata infrastructure is created. Therefore, check the displayed region to ensure that you are using the most appropriate region for your infrastructure.

    * **Choose a compartment:** From the list of available compartments, choose the compartment that you want to contain the Oracle Exadata infrastructure.

    * **Provide the display name:** The display name is a name that you can use to identify the Exadata infrastructure.

    * **Select the Exadata system model:** From the list, choose an Oracle Exadata system model.

    * **Compute and storage configuration:**

          * **Database servers:** You can add a minimum of 2 and extend up to a maximum of 8 database servers.

          * **Storage servers:** You can add a minimum of 3 and extend up to a maximum of 12 storage servers. For each storage server you add, the storage capacity that will be added is displayed on the right.

    * **Configure the cloud control plane server network** Each Oracle Exadata Database Service on Cloud@Customer system contains two control plane servers, which enable connectivity to Oracle Cloud Infrastructure. The control plane servers are connected to the control plane network, which is a subnet on your corporate network. The following settings define the network parameters:

          * **Control Plane Server 1 IP Address:** Provide the IP address for the first control plane server. This IP address is for the network interface that connects the first control plane server to your corporate network using the control plane network.

          * **Control Plane Server 2 IP Address:** Provide the IP address for the second control plane server. This IP address is for the network interface that connects the second control plane server to your corporate network using the control plane network.

          * **Netmask:** Specify the IP netmask for the control plane network.

          * **Gateway:** Specify the IP address of the control plane network gateway.

          * **HTTP Proxy:** (Optional) You can choose to use this field to specify your corporate HTTP proxy.

          * **Enable Control Plane Server Offline Report:** Enabling the Control Plane Server (CPS) offline report helps in diagnosing connectivity issues between the CPS and OCI endpoints, should they arise.

     * **Configure the Oracle Exadata system networks** Each Oracle Exadata Database Service on Cloud@Customer system contains two system networks, which are not connected to your corporate network. The following settings define IP address allocations for these networks:

          * **Administration Network CIDR Block** Specifies the IP address range for the administration network using CIDR notation. The administration network provides connectivity that enables Oracle to administer the Exadata system components, such as the Exadata compute servers, storage servers, network switches, and power distribution units. You can accept the suggested default, or specify a custom value.

          * **Private Network CIDR Block** Specifies the IP address range for the Exadata secure fabric network using CIDR notation.

     * **Configure DNS and NTP services** Each Exadata Database Service on Cloud@Customer system requires access to Domain Names System (DNS) and Network Time Protocol (NTP) services.

          * **DNS Servers:** Provide the IP address of a DNS server that is accessible using the control plane network. You may specify up to three DNS servers.

          * **NTP Servers:** Provide the IP address of an NTP server that is accessible using the control plane network. You may specify up to three NTP servers.

     * **Select the time zone** The default time zone for the Exadata Infrastructure is UTC, but you can specify a different time zone.

     * **Provide maintenance details**

          * **Configure automatic maintenance** Click **Edit Maintenance Preferences**. Edit Maintenance Preferences dialog is displayed.

          * **Choose a maintenance method:**

            * **Rolling:** By default, Exadata Infrastructure is updated in a rolling fashion, one server at a time with no downtime.

            * **Non-rolling:** Update database and storage servers at the same time. The non-rolling maintenance method minimizes maintenance time but incurs full system downtime.

          * **Enable custom action before performing maintenance on DB servers:** Enable custom action only if you want to perform additional actions outside of Oracle’s purview.

            * **Custom action timeout (in minutes):** Timeout available to perform custom action before starting maintenance on the DB Servers.

          * **Configure the automatic Maintenance schedule:**

            * **No preference:** The system assigns a date and start time for infrastructure maintenance.

            * **Specify a schedule:** Choose your preferred month, week, weekday, start time, and lead time for infrastructure maintenance.

          * Click **Save Changes.**

      * **Provide maintenance contacts** Maintenance contacts are required for service request-based communications for hardware replacement and other maintenance events.

      * **Show Advanced Options** You have the option to configure advanced options. You can choose to apply **Tags**

7. Click **Create Exadata Infrastructure** If all of your inputs are valid, then the Infrastructure Details page appears. The page outlines the next steps in the provisioning process. Initially, after creation, the state of the Oracle Exadata infrastructure is **Requires-Activation**.

## Task 2: Activate Exadata Database Service on Cloud@Customer Infrastructure

* To activate Oracle Exadata Database Service on Cloud@Customer infrastructure, ensure that you meet the prerequisites, and complete this procedure.

    * Ensure that you have added a primary contact. You cannot activate your infrastructure without adding a primary maintenance contact.

    * Locate the activation file. This file is supplied to you by Oracle after installation and initial configuration of your Oracle Exadata Database Service on Cloud@Customer system.

    * Ensure that the current state of your infrastructure is **Requires Activation**. You can only activate Oracle Exadata if its state is **Requires Activation**.

1. Download the activation file.

2. Click **Exadata Infrastructure**.

3. Click the name of the Oracle Exadata infrastructure that you want to activate. The Infrastructure Details page displays information about the selected Oracle Exadata infrastructure.

4. Click **Activate** on the banner displayed. The **Activate** button is only available if the Oracle Exadata infrastructure requires activation.

5. Use the Activate dialog to upload the activation file, and then click **Activate Now**.
After activation, the state of the Oracle Exadata infrastructure changes to **Active**.


You may now **proceed to the next lab**

## Learn More

* Click [here](https://docs.oracle.com/en/engineered-systems/exadata-cloud-at-customer/ecccm/ecc-provisioning.html#GUID-4CB5B5E1-E853-4CA2-B43D-54CD18A8F28A) to learn more about Creating Infrastructure resource for Exadata Database Service on Cloud@Customer.

## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler, Product Management

* **Contributors** - Tammy Bednar, Product Management

* **Last Updated By** - Leo Alvarado, Product Management, April 2023.
