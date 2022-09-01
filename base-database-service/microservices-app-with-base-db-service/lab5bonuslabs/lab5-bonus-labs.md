# Bonus Lab


## Introduction

This lab walks you through the steps to Run the Bonus Challenge Labs.

Estimated Time: 30 minutes




### Objectives

-   Complete all the challenge Labs.

### Prerequisites

This lab requires completion of the following:

* Setting Up Your Tenancy - After Oracle creates your tenancy in OCI, an administrator at your company will need to perform some setup tasks and establish an organization plan for your cloud resources and users.




## Task 1: Create Database 19c Custom Image.

In this lab, we will go through how to create a Custom Database Software Image using the OCI Console:
 
  * **Database software images** are resources containing Oracle Database software used to provision and patch Oracle Databases and Oracle Database Homes.
  * **Database software images** are either **Oracle-published software releases** or **custom software images that you create**.
  * **Custom Database Software Images** are images that include specified patches and updates that meet your organization standards.

1. Let’s begin **Creating our Custom DB Software Image** by opening the **OCI navigation menu**. Click on **Oracle Database**, then click on **Oracle Base Database**.

    ![Create Custom DB Software Image](./images/db-custom-image.png" ")

2. On the left rail under Resources, click on Database Software Images.

3. Click on the Create Database Software Image button.

4. In the Display Name field, provide a display name for your image.

    For our lab enter *My19-14_DBImage*

5. Ensure that the Compartment Chosen is the Compartment assigned for your lab.

6. Choose Virtual Machine and Bare Metal Shapes for the the Shape family.

    This will populate the eligible Database Versions for the selected shape.

7. Choose the Database Version for your image.

    For our lab select *19c*

8. Choose a Software Update from the Choose a patch set update, proactive bundle patch, or release update drop-down list.

    For our lab select *19.14.0.0*

9. In the One-Off Patch Field, you can optionally enter a comma-separated list of one-off (interim) update numbers.

    For our lab we will leave this blank

10. In the upload Oracle Home Inventory field, you can optionally upload an Oracle home inventory file from an existing Oracle Database.

    For our lab we will leave this blank

11. Click on the Show Advanced Options link to add tags to your database software image.

    If you are not sure if you should apply tags, skip this option (you can apply tags later).
    For our lab we will leave this blank

12. Click on the Create Database Software Image button to complete the task.

## Task 2: Create Pluggable Database (MyPDB).
## Task 3: Create Pluggable Database Clone (MyPDBClone).
## Task 4: Change DB System License Type.
## Task 5: View Database Metrics.
## Task 6: Change DB System VM Shape / Scale OCPU.
## Task 7: Scale DB System Storage.
## Task 8: Enable Automatic Backup for DB System.






## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler Product Management

* **Contributors** - Tammy Bednar Product Management

* **Last Update** - Aug 2022.
