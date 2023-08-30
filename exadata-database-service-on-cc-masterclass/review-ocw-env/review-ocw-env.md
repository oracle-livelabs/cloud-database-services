


# Review and Connect to Oracle CloudWorld Lab Resources


## Introduction

This lab walks you through reviewing and connecting to the Oracle Cloud World lab environment.

Estimated Time: 15 minutes

<!-- Watch the video below for a quick walk-through of the lab.
[Create an Exadata Database Service on Cloud@Customer Infrastructure](youtube:DCrivNA5bs8)
-->
### Objectives

-   After completing this lab, you should be able to learn how to navigate, review and connect to the Oracle Cloud World lab environment.

### Prerequisites

This lab requires completion of the following:

* Login to **Oracle Cloud** using **OSC's tenancy** with your assigned workshop credentials





## Task 1: Discover and Connect to the Application Server (Oracle Cloud Developer Image)

1. Open the navigation menu. Under **Compute**, click **Instances**.
   
   ![navigage compute](./images/navigate-compute.png " ")

2. Under Compute, Click on **Instances** 
   
3. Select your assigned **Compartment**.
   
   From the list of Instances displays. Find the Compute named **MyAppServer**, and document the **Private IP address** for later use.

   ![discover compute networking details](./images/discover-app-server.png " ")
   

4. Open your local terminal and connect to the local OSC bastion server
   
      ```
        <copy>

        ssh -i ~/sshkey_student_xx.key -l opc (Use the assigned IP address) 

        </copy>
        ```

5. Use the assigned SSH Key to connect to the application server instance
   
      ```
        <copy>

        ssh -i ~/sshkey_student_xx.key -l opc (Use the IP address of the application server discovered in Step 3)

        </copy>
        ```
## Task 2: Discover and Connect to an Exadata Database Service Virtual Machine with SSH 

1. Open the navigation menu. Under **Oracle Database**, click **Exadata Database Service on Cloud@Customer**.
   
   ![navigage oci console](./images/navigateocimenu.png " ")

2. Select your assigned **Compartment**, then Navigate to the **VM Cluster Details** page of your assigned VM Cluster named **MyVMClusterXX**.
   
   ![navigate to exadata vmcluster](./images/navigate-vmcluster.png " ")

    The VM Cluster Details page displays information about the selected VM cluster.

   ![exadata vmcluster details page](./images/vmcluster-details-page.png " ")



3. Under the **Resources** section on the left banner, click on **Virtual Machines**.

    The list of virtual machines displays. The **name**, **state**, and **client IP address** are displayed for each virtual machine in the VM cluster.

4. Find and document the **Client IP Address** of the first virtual machine for later use.

    ![VM Client IP](./images/vm-client-ip.png" ")

5. From the App Server, Run the command to connect to the Exadata Database Service Virtual Machine with SSH.

      ```
              <copy>

              ssh -i ~/sshkey_student_xx.key -l opc (IP address of the virtual machine, obtained from step 4)

              </copy>
      ```
       

## Task 3: Discover and Connect to the Oracle Database on Exadata Database Service with Oracle Sqldeveloper

1. From the Virtual Machines list page, Under the **Resources** section on the left banner, Click on **Databases**, then Click on the **Container Database** named **MyCDB01**. 

  ![Navigate CDB](./images/navigate-cdb.png" ")

2. Under the **Resources** section on the left banner, Click on **Pluggable Databases**. Then Click on the **Pluggable Database** named **MyPDB**.

  ![PDB list menu](./images/mypdb-list.png" ")

3. In the **Pluggable Databases section** of the page, Near the top, Click on the **PDB Connection** button.

  ![PDB list menu](./images/mypdb-page.png" ")

4. This will render the **Pluggable Database Connection** Screen. **Click** the **Copy  Link** and paste the **Connection String** to your notepad or text editor.

  ![PDB Connection](./images/pdb-connection-string.png" ")

5. From the application server compute instance, launch Oracle SQL Developer and connect to Oracle Database on Exadata Database Service.

      * Select **Create New Connection** Icon
      * Enter a **Name** for the Connection
      * For the **Database Type**, select **Oracle**
      * For the **Username**, enter **Sys**
      * Enter the Sys **password**
      * For the Role, select **SYSDBA**
      * For the **Hostname**, enter the **Hostname** *(from the PDB connection string - obtained from Step 4)*
      * For the **Port** enter **1521**
      * Enter the Database **Service Name**, enter the **Service Name** *(from the PDB connection string - obtained from Step 4)* 
      * **Test** & **Save** the connection
      * Click on **Connect**

  ![connecting using sqldev](./images/sqldev.png" ")


You may now **proceed to the next lab**.

<!--
## Learn More

* Click [here](https://docs.oracle.com/en/engineered-systems/exadata-cloud-at-customer/ecccm/ecc-provisioning.html#GUID-4CB5B5E1-E853-4CA2-B43D-54CD18A8F28A) to learn more about Creating Infrastructure resource for Exadata Database Service on Cloud@Customer.

-->
## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler, Product Management

* **Contributors** - Tammy Bednar, Product Management

* **Last Updated By** - Leo Alvarado, Product Management, July 2023.
