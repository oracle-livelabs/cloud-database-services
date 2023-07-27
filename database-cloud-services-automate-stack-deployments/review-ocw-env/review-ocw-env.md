


# Review and Connect to Oracle CloudWorld Lab Environment


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
* Obtain your assigned **Secure Global Desktop (SGD)** login credentials




## Task 1: Review creating an Exadata Database Service on Cloud@Customer Resource Model

  *(For this lab, The Exadata Database Service on Cloud@Customer Resource Model is pre-provisioned - Informational Instructions for navigating the Exadata Database Service on Cloud@Customer environment will be presented by the speakers)*

## Task 2: Discover and Connect to the Application Server (Oracle Cloud Developer Image)

1. Open the navigation menu. Under **Compute**, click **Instances**.
   
   ![navigage compute](./images/navigate-compute.png " ")

2. Under Compute, Click on **Instances** 
   
3. Select your assigned **Compartment**.
   
   The list of Instances displays. The **name**, **state**, and **IP address** are displayed for each compute host.

   ![discover compute networking details](./images/discover-app-server.png " ")
   
4. Launch the **Secured Global Desktop (SGD)** by clicking on this [URL](https://sgdsca.osc.oracle.com/sgd/thin.jsp?clientmode=installed) 
   
   ![SGD login](./images/sgd-login.png " ")
   
   Enter your assigned Secured Global Desktop **username** and **Password** for your login.

5. Launch the SGD Linux Desktop
   
   ![SGD linux Desktop](./images/sgd-linux-desktop.png " ")

6. Open the terminal and type the following command. 
   
   ![ssh to database client](./images/ssh-app-tool.png " ")
    
      ```
        <copy>

        ssh ocw23bastion.us.osc.oracle.com 

        </copy>
      ```     

7. Use the assigned SSH Key to connect to the application server instance
   
      ```
        <copy>

        ssh -i ~/sshkey_student_xx.key -l opc (Use the IP address of the application server discovered in Step 2)

        </copy>
        ```
## Task 3: Discover and Connect to an Exadata Database Service Virtual Machine with SSH 

1. Open the navigation menu. Under **Oracle Database**, click **Exadata Database Service on Cloud@Customer**.
   
   ![navigage oci console](./images/navigateocimenu.png " ")

2. Select the assigned **Compartment**, then Navigate to the **VM Cluster Details** page of the VM Cluster that contains the virtual machine you are interested in.

    The VM Cluster Details page displays information about the selected VM cluster.

3. In the **Resources** list, click **Virtual Machines**.

    The list of virtual machines displays. The **name**, **state**, and **client IP address** are displayed for each virtual machine in the VM cluster.

4. Find the virtual machine you want in the Virtual Machines list and check its state.

    The color of the icon and the associated text indicate its status.

      * **Available**: Green icon. The node is operational.
      * **Starting**: Yellow icon. The node is starting because of a start or reboot action in the Console or API.
      * **Stopping**: Yellow icon. The node is stopping because of a stop or reboot action in the Console or API.
      * **Stopped**: Yellow icon. The node is stopped.
      * **Failed**: Red icon. An error condition prevents the continued operation of the virtual machine.

    Take note of the client IP address of the virtual machine.

    ![VM Client IP](./images/vm-client-ip.png" ")

5. From your Bastion host *(In Task 2 Step 5)*, Run the command to connect to the Exadata Database Service Virtual Machine with SSH.

      ```
              <copy>

              ssh -i ~/sshkey_student_xx.key -l opc (IP address of the virtual machine, obtained from step 4)

              </copy>
      ```
       

## Task 4: Discover and Connect to the Oracle Database on Exadata Database Service

1. From the Virtual Machines list page, On the left rail, Under **Resources**, Click on **Databases**, then Click on the **Name of your Container Database**. 

  ![Navigate CDB](./images/navigate-cdb.png" ")

2. On the left rail, under **Resources**, Click on **Pluggable Databases**. Then Click on the **Name of your Pluggable Database**.

  ![PDB list menu](./images/mypdb-list.png" ")

3. In the **Pluggable Databases section** of the page, Near the top, Click on the **PDB Connection** button.

  ![PDB list menu](./images/mypdb-page.png" ")

4. This will render the **Pluggable Database Connection** Screen. **Click** the **Copy  Link** and paste the **Connection String** to your notepad or text editor.

  ![PDB Connection](./images/pdb-connection-string.png" ")

1. From the application server compute instance, launch Oracle SQL Developer and connect to Oracle Database on Exadata Database Service.

      * Select Create New Connection Icon
      * Enter a Name for the Connection
      * For the Database Type, select Oracle
      * For the Username, enter Sys
      * Enter the Sys password
      * For the Role, select SYSDBA
      * For Hostname, enter localhost
      * For Port enter 1521
      * Enter Database Service Name
      * Test & Save the connection

  ![connecting using sqldev](./images/sqldev.png" ")


You may now **proceed to the next lab**.

<!--
## Learn More

* Click [here](https://docs.oracle.com/en/engineered-systems/exadata-cloud-at-customer/ecccm/ecc-provisioning.html#GUID-4CB5B5E1-E853-4CA2-B43D-54CD18A8F28A) to learn more about Creating Infrastructure resource for Exadata Database Service on Cloud@Customer.

-->
## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler, Product Management

* **Contributors** - Tammy Bednar, Product Management

* **Last Updated By** - Leo Alvarado, Product Management, April 2023.
