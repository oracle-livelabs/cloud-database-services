


# Review Option to configure Automatic Infrastructure Maintenance


## Introduction

This lab walks you through the steps to configure Automatic Infrastructure Maintenance for your Exadata Cloud@Customer Infrastructure.

Estimated Lab Time: 15 minutes

<!-- Watch the video below for a quick walk-through of the lab.
[Create an Exadata Database Service on Cloud@Customer Infrastructure](youtube:DCrivNA5bs8)
-->
### Objectives

-   After completing this lab, you should be able to configure Automatic Infrastructure Maintenance for your Exadata Cloud@Customer Infrastructure.

### Prerequisites

This lab requires completion of the following:

* Completion of **Lab9**

## Task 1: Review Option to configure Automatic Infrastructure Maintenance

*(For this lab, Informational Instructions for Configuring Automatic Infrastructure Maintenance for the Exadata Database Service on Cloud@Customer environment will be presented by the speakers)*

1. Open the navigation menu. Under **Oracle Database**, click **Exadata Database Service on Cloud@Customer**.
   
2. Select your ***Assigned Region*** and ***Assigned Compartment*** 
   
3. Click your ***Assigned Exadata Infrastructure***

4. Click **Edit Maintenance Preferences**.

5. On the Edit Maintenance Preferences page, configure the following:

    **Choose a maintenance method**:

    * **Rolling**: By default, Exadata Infrastructure is updated in a rolling fashion, one server at a time with no downtime.
    * **Non-rolling**: Update database and storage servers at the same time. The non-rolling maintenance method minimizes maintenance time but incurs full system downtime.

    **Enable custom action before performing maintenance on DB servers**: Enable custom action only if you want to perform additional actions outside of Oracle’s purview

    * **Configure Custom action timeout (in minutes)**: Timeout available to perform custom action before starting maintenance on the DB Servers.
    
    **Maintenance schedule**:

    * **Under Maintenance months**, specify at least one month for each quarter during which Exadata infrastructure maintenance will take place. 
    * **Under Week of the month**, specify which week of the month, maintenance will take place. 
    * **Under Day of the week**, specify the day of the week on which the maintenance will occur.
    * **Under Start hour**, specify the hour during which the maintenance run will begin.
    * **Under Lead Time**, specify the minimum number of weeks ahead of the maintenance event you would like to receive a notification message.

6. Click **Save Changes**.

You may now **proceed to the next lab**

## Learn More

* Click [here](https://docs.oracle.com/en/engineered-systems/exadata-cloud-at-customer/ecccm/ecc-provisioning.html#GUID-4CB5B5E1-E853-4CA2-B43D-54CD18A8F28A) to learn more about Creating Infrastructure resource for Exadata Database Service on Cloud@Customer.

## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler, Product Management

* **Contributors** - Tammy Bednar, Product Management

* **Last Updated By** - Leo Alvarado, Product Management, August 2023.
