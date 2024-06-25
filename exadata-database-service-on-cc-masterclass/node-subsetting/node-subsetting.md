


# Scale Exadata VM Cluster to run on a Subset of the available compute nodes


## Introduction

This lab walks you through the steps to Scale Exadata VM Cluster to run on a Subset of the available compute nodes.

Estimated Lab Time: 15 minutes

<!-- Watch the video below for a quick walk-through of the lab.
[Create an Exadata Database Service on Cloud@Customer Infrastructure](youtube:DCrivNA5bs8)
-->
### Objectives

-   After completing this lab, you should be able to Scale Exadata VM Cluster to run on a Subset of the available compute nodes

### Prerequisites

This lab requires completion of the following:

* Completion of **Lab1**

## Task 1: Scale Exadata VM Cluster to run on a Subset of the available compute nodes 

1. Open the navigation menu. Under **Oracle Database**, click **Exadata Database Service on Cloud@Customer**.
   
2. Select your ***Assigned Compartment***, and Click your assigned **VM Cluster** named ***MyVMClusterXX***.
   
3. In the VM Cluster Details page, under **Resources**, click **Virtual Machines**, and then click Add **Virtual Machines**.

4. On the **Add Virtual Machines** page, select additional DB servers on which to add the VM.
   
      * Select the DB servers with the **Available to add** status and then click **Save Changes**.

5. Note that the expansion of the VM Cluster will show the additional VM Capacity on the **VM Cluster Details page** and that the status of the VM Cluster will remain in the ***Updating*** state until the VMs are fully added.


## Learn More

* Click [here](https://docs.oracle.com/en/engineered-systems/exadata-cloud-at-customer/ecccm/ecc-manage-vm-clusters.html#GUID-53A7D800-C948-4160-BA46-C9D7907E247A) to learn more about VM Cluster Node Subsetting for Exadata Database Service on Cloud@Customer.

## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler, Product Management

* **Contributors** - Tammy Bednar, Product Management

* **Last Updated By** - Leo Alvarado, Product Management, September 2023.
