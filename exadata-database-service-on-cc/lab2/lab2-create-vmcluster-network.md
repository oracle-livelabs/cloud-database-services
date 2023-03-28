
# Create a VM Cluster Network resource


## Introduction

This lab walks you through the steps to create a VM Cluster Network resource

Estimated Lab Time: 10 minutes

Watch the video below for a quick walk-through of the lab.
[Create a VM Cluster Network](youtube:5gaKF1ewyRg)




### Objectives

-   Create a VM Cluster Network resource


### Prerequisites

This lab requires completion of the following:

* You must plan on allocating host names, subnets and a range of IP addresses for network interfaces on the client network and the backup network are required. The client network and the backup network require separate subnets.

* Oracle recommends that you register the host names and IP addresses for the Exadata Database Service on Cloud@Customer network interfaces in your corporate Domain Name System (known as DNS).

* Completion of Lab1

## Task 1: Create a VM Cluster Network resource

1. Open the navigation menu. Under **Oracle Database**, click **Exadata Database Service on Cloud@Customer**.

2. Choose the **Region** and **Compartment** that contains the Exadata infrastructure for which you want to create a VM cluster network.

3. Click **Exadata Infrastructure**.

4. Click the name of the Exadata infrastructure for which you want to create a VM cluster network.

5. Click **Create VM Cluster Network**.

6. Provide the requested information on the Data Center Network Details page:

    * **Provide the display name**. The display name is a name that you can use to identify the VM cluster network.

    * **Assign IPs to DB servers**. By default, all DB servers are assigned IP addresses to enable easy addition and removal of VMs to the cluster in the future. Note that while DB Servers can be added to or removed from the VM Cluster Network, addresses cannot be changed in the future. It is advisable to plan ahead and reserve enough addresses with your network team to accommodate any and all future growth of your VM Cluster to avoid a database migration scenario in the future.

    * **Provide client network details**. The client network is the primary channel for application connectivity to Exadata Database Service on Cloud@Customer resources. The following settings define the required network parameters:

        * **VLAN ID:** Provide a virtual LAN identifier (VLAN ID) for the client network between 1 and 4094, inclusive.

        * **Database servers starting IP address:** Using CIDR notation, provide the IP address range for the client network.

        * **Netmask:** Specify the IP netmask for the client network.

        * **Gateway:** Specify the IP address of the client network gateway.

        * **Hostname Prefix:** Specify the prefix that is used to generate the hostnames in the client network.

        * **Domain Name:** Specify the domain name for the client network.

    * **Provide DNS and NTP server details**. The VM cluster network requires access to Domain Names System (DNS) and Network Time Protocol (NTP) services. The following settings specify the servers that provide these services:

        * **DNS Servers:** Provide the IP address of a DNS server that is accessible using the client network. You may specify up to three DNS servers.

        * **NTP Servers:** Provide the IP address of an NTP server that is accessible using the client network. You may specify up to three NTP servers.

    * **Configure Advanced Options.**

        * **Network:** (Optional) Assign a SCAN listener port (TCP/IP) in the range between 1024 and 8999. Default is 1521.

        * **Tags:** (Optional) You can choose to apply tags.

7. Click **Review Configuration**.

8. (Optional) You can choose to adjust the system-generated network definitions on the Review Configuration page. Click **Edit** to adjust the system-generated network definitions to meet your requirements.

9. Click **Create VM Cluster Network**. The VM Cluster Network Details page is now displayed. Initially, after creation, the state of the VM cluster network is **Requires Validation**.


## Task 2: Validate the VM Cluster Network

You can only validate a VM cluster network if its current state is Requires Validation, and if the underlying Exadata infrastructure is activated.

1. Click the name of the VM cluster network that you want to validate. The VM Cluster Network Details page displays information about the selected VM cluster network.

2. Click **Validate VM Cluster Network**. Validation performs a series of automated checks on the VM cluster network.

3. Click **Validate** to confirm the action.

    After successful validation, the state of the VM cluster network changes to **Validated** and the VM cluster network is ready to use.


You may now **proceed to the next lab**



## Want to Learn More?

Click [here](https://docs.public.oneportal.content.oci.oraclecloud.com/en-us/iaas/exadata/doc/ecc-setting-up-the-network.html) to learn more about Creating VM Cluster Network on Exadata Database Service on Cloud@Customer.

## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler, Product Management

* **Contributors** - Tammy Bednar, Product Management

* **Last Update** - Feb 2023.
