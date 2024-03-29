# Run the Application


## Introduction

This lab walks you through the steps to Run the Microservices-based Application Connected to Oracle Base Database Service.

Estimated Time: 15 minutes

<if type="sandbox">
Watch the video below for a quick walk-through of the lab.
[Run the Application](videohub:1_ps0dr7bv)
</if>

### Objectives

-   Configure Microservice Application to Connect to Oracle Base Database Service.

### Prerequisites

This lab requires completion of the following:

* Setting Up Your Tenancy - After Oracle creates your tenancy in OCI, an administrator at your company will need to perform some setup tasks and establish an organizational plan for your cloud resources and users.




## Task 1: Run the Application.

1. Open the terminal, go to the directory of your application */home/opc/basedb*

   ![Navigate to app home directory](./images/basedb.png" ")

2. To run the application, use *./gradlew run*.

   ![Run Application](./images/gradlew.run.png" ")


   The startup will start the application on port 8080.

   You should see an output similar to the following, indicating that the database connectivity is all handled automatically and the Flyway DB migration runs. Since we enabled the query monitor then you’ll see the results of the work done by DataPopulator:

   ![Run Application](./images/run.app.png" ")



## Task 2: Test the Application.

1. You can run some cURL requests to test the application:

   Open a new tab in the terminal, and run the cURL requests.

    ```
    <copy>

      curl -i localhost:8080/things

    </copy>
    ```

    You should see an output similar below, showing our data entries for Fred and Barney

    ![Run Application things](./images/things.png" ")

    You can also run the cURL using the browser

    ![Run Application things](./images/browser.png" ")

2. Let's do more cURL requests testing; this time, let's view our data record for Fred.

    ```
    <copy>

        curl -i localhost:8080/things/Fred

    </copy>
    ```

    You should see the output for the data entry for Fred.

    ![Run Application things](./images/things.fred.png" ")


    Let's view our data record for Barney

    ```
    <copy>

        curl -i localhost:8080/things/Barney

    </copy>
    ```

    You should see the output for the data entry for Barney.

    ![Run Application things](./images/things.barney.png" ")


3. Now let's try testing to view data entry for Leo.


    ```
    <copy>

        curl -i localhost:8080/things/Leo

    </copy>
    ```

    ![Run Application things](./images/things.leo.png" ")


    You should see the output "Page Not Found", as we do not have data entry for Leo.

You may now **proceed to the next lab**.



## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler, Product Management

* **Contributors** - Tammy Bednar, Product Management

* **Last Update** - Sep 2022.
