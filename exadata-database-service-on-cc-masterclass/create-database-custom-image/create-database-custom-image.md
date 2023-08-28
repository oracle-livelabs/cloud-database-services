# Create Oracle Database on Exadata Database Service


## Introduction

This lab walks you through the steps to create a Custom Database Software Image using the OCI Console.
 
  * **Database software images** are resources containing Oracle Database software used to provision and patch Oracle Databases and Oracle Database Homes.
  * **Database software images** are either **Oracle-published software releases** or **custom software images that you create**.
  * **Custom Database Software Images** are images that include specified patches and updates that meet your organization's standards.

Estimated Lab Time: 15 minutes

Watch the video below for a quick walk-through of the lab.
  [Create a Custom Database Software Image](youtube:jwxxIih3brQ)

### Objectives

-   After completing this lab, you should be able to create a database on Exadata Database Service


### Prerequisites

This lab requires completion of the following:

* Completion of **Lab1**

## Task 1: Create Database Custom Image using OCI Console

1. Open the navigation menu. Under **Oracle Database**, click **Exadata Cloud@Customer**.

2. Under **Resources**, click **Database Software Images**.

3. Click **Create Database Software Image**.

4. In the **Display name** field, provide a display name for your image.

5. Choose your **Compartment**.

6. Choose the **Database version** for your image.

7. Choose the **patch set update, proactive bundle patch, or release update**.

    * Optionally, you can enter a comma-delimited list of one-off (interim) patch numbers.
    * Optionally, you can upload an Oracle Home inventory file from an existing Oracle Database.

8. Click **Show Advanced Options** to add **tags** to your database software image.

9. Click **Create Database Software Image**.



## Learn More

* Click [here](https://docs.public.oneportal.content.oci.oraclecloud.com/en-us/iaas/exadata/doc/ecc-create-first-db.html) to learn more about Creating an Oracle Database on Exadata Database Service.

## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler, Product Management

* **Contributors** - Tammy Bednar, Product Management

* **Last Updated By** - Leo Alvarado, Product Management, April 2023.
