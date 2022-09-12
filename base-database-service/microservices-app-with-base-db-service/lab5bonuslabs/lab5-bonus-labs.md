# Bonus Labs


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

    ![Create Custom DB Software Image](./images/db.custom.image.png" ")

2. On the left rail under **Resources**, click on **Database Software Images.**

3. Click on the **Create Database Software Image** button.

4. In the **Display Name** field, provide a display name for your image.

    * For our lab enter *My19-14_DBImage*

5. Ensure that the Compartment Chosen is the **Compartment** assigned for your lab.

6. Choose **Virtual Machine and Bare Metal Shapes** for the the Shape family.

    * This will populate the eligible Database Versions for the selected shape.

7. Choose the **Database Version** for your image.

    * For our lab select *19c*

8. Choose a **Software Update** from the Choose a patch set update, proactive bundle patch, or release update drop-down list.

    * For our lab select *19.14.0.0*

9. **In the One-Off Patch Field**, you can optionally enter a comma-separated **list of one-off (interim) update numbers.**

    * For our lab we will leave this blank

10. **In the upload Oracle Home Inventory field**, you can optionally upload an **Oracle home inventory** file from an existing Oracle Database.

    * For our lab we will leave this blank

11. Click on the **Show Advanced Options** link to add tags to your database software image.

    * If you are not sure if you should apply tags, skip this option (you can apply tags later).
    * For our lab we will leave this blank

12. Click on the **Create Database Software Image** button to complete the task.

## Task 2: Create Pluggable Database (MyPDB).

In this lab, we will go through **Creating a Pluggable Database on an existing VM DB System** using the OCI Console:

Let’s start by **opening the navigation menu**.

1. Click on **Oracle Database**, then click on **Oracle Base Database**

2. **The Compartment** field defaults to your current compartment.

    * **Validate that the Compartment** shown contains the **DB System** in which you want to **create the PDB**.
 
3. From the list of DB Systems, find the DB System in which you want to create the PDB.

     * For your lab Click on the **Display Name** of your **DB System**
     * This will bring up the **DB Systems Details Page**
     * Note that the **State** of the **DB Systems** is shown as **AVAILABLE** as depicted by the Green Icon on the on the upper left of the screen
 
 
4. In the Databases section of the **DB System Details page**, Click on the Database Name

     * This will bring up the **Database Details Page**
     * Note that the **State** of the **Database** is shown as **AVAILABLE**
 
5. On the left rail under **Resources**, Click **Pluggable Databases**
 
6. In the **Pluggable Databases** section of the **Database Details page**, Click on the Create Pluggable Database button.

  ![Create PDB](./images/bonus.lab.2.png" ")

      * This will bring up the **Create Pluggable Database Dialog screen**

7. Specify a user-friendly **name** that you can use to identify the **PDB**

      * For our Demo we will use **MyPDB** for the **PDB Name**

8. Check the box to **Unlock the PDB Admin Account**

9. Enter the **PDB Admin Password** and the **TDE Wallet Password**

      * For our lab, Enter the same password as the SYS password

Now that we have named our PDB and provided the Admin Passwords, let’s look at what is available under the **Advanced Options:**

**Under Advanced Options**, you can optionally apply tags to help you organize and track your resources.
If you are not sure if you should apply tags, then skip this option (you can apply tags later).
 
10. Click the **Create Pluggable Database** button to proceed with creating our PDB.

      * While the **create pluggable database process** is running, the state of the Database is **Provisioning.**
 
11. On the left rail, You can click on **WORK REQUESTS** to monitor the progress of your request to **create the Pluggable Database**.

      * When the Database creation process completes, the state of the Database in the Work Request changes from **In Progress** to **Succeeded**.

12. Click on **Pluggable Database Details** in the in the bread crumb trial to go to the Pluggable Database Details Page

      * Note that the **Pluggable Database State** is shown as **AVAILABLE**
 
13. Click on the **PDB Connections** button, to see the connect string for **connecting** to your PDB’s **administration service**.
 
 

Congratulations on accomplishing the mission of **Creating a PDB in an existing Container Database in a VM DB System!!!**

## Task 3: Create Pluggable Database Clone (MyPDBClone).

In this lab we will go through **How to Clone a PDB in a VM DB System** using the OCI Console:
 
To begin the process of **Cloning a PDB in a VM DB System**.

1. **Open** the **Navigation Menu**. Select **Oracle Database**, then click on **Oracle Base Database**.

2. On the left rail, ensure that the Compartment chosen contains the DB system where you want to create your PDB Clone.

3. In the list of DB systems, click on the name of the DB System in which you want to create the PDB clone.

    * This will bring up the DB Systems details page

4. In the Databases section of the DB System Details page, click on the database name to display the details about it.

5. On the left rail under Resources, Click Pluggable databases

6. In the Pluggable Databases section of the Database Details page, find the PDB you want to clone, and then click the PDB name to display details about it.

7. Near the top of the page, Click on the Clone button.

  ![Create PDB CLONE](./images/create.pdb.clone.png" ")

    * This will render the Clone PDB dialog box

8. In the Clone PDB dialog box, validate pre-populated fields and enter the following:

    * DB System: is a pre-populated read-only field.
    * Destination Database: is a pre-populated read-only field.
    * For the PDB Name: Provide a name for the new cloned PDB. The name must begin with an alphabetic character and can contain up to 30 characters.
    * For the Database TDE wallet password: Enter the TDE wallet password for the parent CDB of the source PDB.
    * For Unlock my PDB admin account: This is Optional. Select this option to specify a PDB admin password and configure the PDB to be unlocked at creation.
    * For the PDB admin password: If you clicked Unlock my PDB admin account, create and enter a new PDB admin password.     
        * The password must contain:
        * 9–30 characters
        * At least two uppercase characters
        * At least two lowercase characters
        * At least two special characters. The valid special characters are: underscore ( _ ), a hash sign (#), and a dash (-). You can use two of the same characters or any combination of two of these characters.
        * At least two numeric characters (0-9)
    * Confirm the PDB admin password: Enter the PDB admin password again to confirm.

9. Click on the Clone PDB button to complete the request.

Congratulations on accomplishing the mission of Cloning a VM DB Systems PDB!!!



## Task 4: Change DB System License Type.

In this lab, we will go through how to  **Change the License Type of a VM DB System** using the OCI Console
 
To begin the process of **Changing the License Type** of a VM DB System, **open the navigation menu**.

1. Click on **Oracle Database**, then click on **Oracle Base Database**.

2. On the left rail, Choose the **Compartment** of the **DB system** that you want to change the license type for.

3. In the list of DB systems displayed, click on the name of the **DB system** whose license type you would like to change.

    * For our lab, select the **name of the DB System assigned** to you.

4. On the **DB System Details page**, near the top of the page click on the **More Actions button**, then click on **Update License Type**.

  ![Change License Type](./images/license.type.png" ")

    * The Update License Type dialog box will display the available license type options, with your current license type selected.

5. Select the **New License Type for your DB System.**

6. Now Click on **Save Changes** to process your request to change the DB System’s Licensing Type.
 

Congratulations on accomplishing the mission of **Changing the License Type for your VM DB System!!!**

## Task 5: View Database Metrics.

In this lab we will go through how to  **View the Database Metrics of a Database on a VM DB System** using the OCI Console
 
To begin the process of **Viewing the Database Metrics of a Database on a VM DB System:**

1. **Open** the **Navigation Menu.** Click on **Oracle Database**, then click on **Oracle Base Database.**

2. On the left rail, Choose the **Compartment** of the **DB system** that you want to view database metrics for.

3. In the list of DB systems displayed, click on the name of the **DB system** that you want to view database metrics for.

    * This will render the **DB System Details page**
    * For our lab, select the name of the DB System assigned to you.

4. On the left rail under **Resources**, click on **Metrics**

  ![DB System Metrics](./images/db.system.metrics.png" ")

  ![DB System Metrics](./images/db.metrics.png" ")


## Task 6: Change DB System VM Shape / Scale OCPU.

In this lab, we will go through how to **Change the Shape of a VM DB System** using the OCI Console
 
* Changing the shape of the VM does not impact the amount of storage available to the DB system.
* However, the new shape can have different CPU, memory, and network bandwidth characteristics
 
Let’s start the process of **Changing our VM Shape** by opening the navigation menu.


1. Click Oracle Database, then click Oracle Base Database.
 
2. On the left rail validate that the Compartment selected contains the DB System that you want to change the VM Shape for.

3. In the list of DB systems, find the name of the DB System you want to change the shape for and click its highlighted name.

    * For our lab, click the name of your assigned DB System
    * This will bring up the DB Systems Details Page
      * Under the General Information section, note that the current Shape is VM Standard 2.2
 
4. Near the top of the page, Click on the Change Shape button.

  ![Change Shape](./images/scale.up.png" ")

    * This will bring up the Change Shape pop up window
    * You will note that our Current DB System Shape is checked
 
5. Select the new shape from the list of compatible and available shapes that are displayed

    * If your Shape is Intel Fixed OCPU based, select the desired Standard VM Shape from the drop-down list
    * If your Shape is an AMD Flex shape the proceed to adjust the enabled VM OCPU to what is required.
    * For our lab, our VM Shape is a AMD Flex so we will configure the desired OCPU to 3 using the Slider. Other resources like Memory and Network Bandwidth will scale proportionally.
 
6. Click on Change Shape to proceed
 
7. On the Change Shape confirmation window, Confirm your desire to Change the DB system shape by enter the name of the DB System we want to change the shape for in the dialog box
 
8. Click on Change Shape button to process your request.
 
9. To check on the progress of your VM Shape Change request, Scroll down and click on Work Requests on the left rail under Resources, Then click on the Change Shape Operation

    * This will bring up the Work Request Details Page from which you can see the log messages and overall operations progress
        * Note that the state of the Work Request is IN PROGRESS and will change to SUCCEEDED once the job completes successfully.
 
10. Now that our Change Shape Request has completed, click on the DB Systems Details Page link in the bread crumb trail

    * This will bring up the DB Systems Details Page
        * Note that the new VM Shape is VM Standard E4 Flex with a CPU Core Count of 3 as we requested




## Task 7: Scale DB System Storage.

In this lab, we will go through how to **Scale the Storage for a VM DB System** using the OCI Console:
 
Let’s start by opening the navigation menu.

1. Click on Oracle Database, then click on Oracle Base Database.

2. On the left rail, Choose the Compartment where the DB System that you want to scale the storage for resides.

3. In the list of DB systems displayed, find the name of the DB System that you want to scale up the Storage for and click its highlighted name.

    * For your lab, Click on the name of your assigned DB System named <DB System Name>-2

4. On the DB Systems Details Page note that the Available Storage is 256GB

5. Click on the Scale Storage Up button

  ![Scale DB System Storage](./images/scale.storage.png" ")
 
   In the Scale Storage Up panel, enter the information to scale your storage as needed:

    * You can Increase the Available data storage: which increases the amount of storage available to your database's data files.
    * You can also Increase the Recovery area storage: which increases the amount of storage available for recovery log data.
        * Oracle recommends keeping recovery storage sized at 20% of the total storage or higher.

    * For this lab, we will increase our Data Storage from 256GB to 512GB
    * Click on the Update button to process the storage expansion request
 
6. Notice that the DB Systems Details Page now shows a State of UPDATING
 
    * Once the Storage expansion request completes, note that the State of the DB System will change from UPDATING to AVAILABLE
    * Also note that the DB System Data Storage now reflects 512GB
 

Congratulations On completing the task of Scaling the VM DB System Storage!!!!



## Task 8: Enable Automatic Backup for DB System.

In this lab, we will go through How to Enable Automatic Backup for a database on an existing VM DB System using the OCI Console
 
* When you launch a DB system, you can optionally enable automatic backups for the initial database.
* Use this procedure to configure or disable automatic backups after the database is created.
 
To begin the process of Enabling Automatic Backup for a Database on an existing VM DB System.:

1. Open the navigation menu. Select Oracle Database, then click Oracle Base Database.

2. On the left rail, Choose the Compartment where the DB System contains the database for which you want to configure automatic backups for resides.

3. In the list of DB systems, click the name of the DB system that contains the database for which you want to configure automatic backups.
      * For this lab, click the name of your assigned DB System named <DB System Name>-2.

4. The details of the DB system followed by a list of databases are displayed.

5. In the list of databases, click the name of the database for which you want to configure automatic backups.

6. The details of the database are displayed.

7. On the Database Details page, in the Database information tab, the Backup details indicate whether automatic backups are enabled. When backups are enabled, the details also indicate the chosen backup retention period.

8. To configure automatic backups, on the Database Details page, click Configure automatic backups.

  ![Enable Automatic Backup](./images/enable.auto.bkup.png" ")

9. In the Configure automatic backups dialog, check Enable automatic backup.

10. When enabling automatic backups, you can choose to configure the following:

  ![Enable Automatic Backup](./images/retention.period.png" ")

      * Backup retention period: If you enable automatic backups, you can choose one of the following preset retention  
        periods: 7 days, 15 days, 30 days, 45 days, or 60 days. The default selection is 30 days.

      * Backup scheduling (UTC): If you enable automatic backups, you can choose a two-hour scheduling window to control
        when backup operations begin. If you do not specify a window, the six-hour default window of 00:00 to 06:00 (in the time zone of the DB system's region) is used for your database.

11. Click Save changes.

Congratulations on accomplishing the mission of Enabling Automatic Backup for a Database on an existing VM DB System!!!




## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler Product Management

* **Contributors** - Tammy Bednar Product Management

* **Last Update** - Aug 2022.
