


# Configure Notifications for Enabled OCPU or License Type change


## Introduction

This lab walks you through the steps to configure notifications to get notified for VM Cluster Event Types such as Enabled OCPU or License Type change.

Estimated Lab Time: 15 minutes

<!-- Watch the video below for a quick walk-through of the lab.
[Create an Exadata Database Service on Cloud@Customer Infrastructure](youtube:DCrivNA5bs8)
-->
### Objectives

-   After completing this lab, you should be able to configure notifications and events rules for Exadata Database Service on Cloud@Customer

### Prerequisites

This lab requires completion of the following:

* Completion of **Lab3**

## Task 1: Configure Notification Topic and Subscription for Enabled OCPU or License Type change

1. Open the navigation menu and click **Developer Services**. Under **Application Integration**, click **Notifications**.
   
   ![Navigate to Notifications](./images/navigate-notifications.png " ")

2. **Topics** page is selected by default, select your ***Assigned Compartment*** and Click **Create Topic**.
   
   ![Click Create Topic](./images/create-topic.png " ")

3. Provide the Topic name. For this lab, use ***MyExaDBCCTopic*** for the Topic name. 
   
   ![Provide Topic display name and Create Topic](./images/create-topic-name.png " ")
   
4. Click **Create**.
   
   ![Click Create Topic](./images/click-create-topic.png " ")

   Once Topic has been created you will see the created Topic with the state of ***Active***

   ![Display Topic Status](./images/create-topic-active.png " ")

5. Click the name of the Topic you created to open the **Topic Details** page 
   
   ![Click on Created Topic](./images/click-on-created-topic.png " ")

6. On the Topic Details page, click **Create Subscription**.
   
   ![Click Create Subscription](./images/create-subscriptions.png " ")

7. In the Create Subscription panel, for **Protocol**, select ***Email***. Provide your ***assigned Email Address*** then Click **Create**
   
   ![Create Subscription](./images/click-create-subscription.png " ")

    >**Note:** Notifications creates the email subscription and sends a confirmation URL to your assigned email address. 
   
   The subscription is ***pending*** until confirmation is received

   ![Subscription Pending Status](./images/subscription-pending-status.png " ")

8. Open your assigned Email, Check for the ***OCI Notifications Service Subscription Confirmation*** email and Click on the ***Confirm subscription*** link
   
   ![Confirm Subscription](./images/confirm-subscription.png " ")

   By clicking the confirmation link, it will launch a browser displaying subscription has been confirmed and that you have subscribed your assigned Email to the Topic you have selected. 

   ![Subscription Confirmation Display](./images/subscription-confirmation-page.png " ")

   You can now see the subscription is now ***Active*** 

    ![Subscription Active](./images/subscription-active.png " ")


## Task 2: Create Events Rule to create notification automation based on Enabled OCPU or License Type change 

1. Open the navigation menu and click **Observability & Management**. Under **Events Service**, click **Rules**.
    
    ![Navigate Rules in OCI Console](./images/navigate-rules.png " ")

2. Select your ***Assigned Compartment*** and Click **Create Rule**
   
    ![Click Create Rule](./images/click-create-rule.png " ")

3. In the Create Rule panel, provide the Rule name. For this lab, use ***MyExaDBCCEventsRule***.
   
    ![Create Events Rule](./images/create-events-rule.png " ")

4. Configure **Rule Conditions**:
   
      * In the **Rule Conditions** section, For Condition, Select ***Event Type***. 
      * For **Service Name**, select ***Database*** 
      * For **Event Type**, Select ***VM Cluster - Update Begin*** and ***VM Cluster - Update End***
    
    ![Configure Rule Conditions](./images/configure-rule-conditions.png " ")

5. Configure **Actions**:
   
      * In the **Actions** section, For **Action Type**, Select ***Notifications***. 
      * For **Notifications Compartment**, select your ***Assigned Compartment*** 
      * For **Topic**, Select ***MyExaDBCCTopic*** 
  
    ![Configure Actions](./images/configure-actions.png " ")

6. Click **Create Rule**
   
    ![Create Rule](./images/create-rule.png " ")



You may now **proceed to the next lab**

## Learn More

* Click [here](https://docs.oracle.com/en/engineered-systems/exadata-cloud-at-customer/ecccm/ecc-provisioning.html#GUID-4CB5B5E1-E853-4CA2-B43D-54CD18A8F28A) to learn more about Creating Infrastructure resource for Exadata Database Service on Cloud@Customer.

## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler, Product Management

* **Contributors** - Tammy Bednar, Product Management

* **Last Updated By** - Leo Alvarado, Product Management, September 2023.
