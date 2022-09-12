# Run the Application


## Introduction

This lab walks you through the steps to Run the Microserives-based Application Connected to Oracle Base Database Service.

Estimated Time: 30 minutes

### Objectives

-   Configure Microservice Application to Connect to Oracle Base Database Service.

### Prerequisites

This lab requires completion of the following:

* Setting Up Your Tenancy - After Oracle creates your tenancy in OCI, an administrator at your company will need to perform some setup tasks and establish an organization plan for your cloud resources and users.




## Task 1: Run the Application.

1. Open the terminal, go to the directory of your application *basedb*

   ![Navigate to app home directory](./images/basedb.png" ")

2. To run the application use *./gradlew run*

   ![Run Application](./images/gradlew.run.png" ")


   Startup will start the application on port 8080.

   You should see output similar to the following, indicating that the database connectivity is all handled automatically, and the Flyway db migration runs. Since we enabled the query monitor then you’ll see the results of the work done by DataPopulator:

   ![Run Application](./images/run.app.png" ")



## Task 2: Test the Application.

1. You can run some cURL requests to test the application:

   Open a new tab in the terminal, and run the cURL requests

    ```
    <copy>

      curl -i localhost:8080/things

    </copy>
    ```

    You should see output similar below, showing our data entries for our new friends Fred and Barney

    ![Run Application things](./images/things.png" ")

    You can also run the cURL using the browser

    ![Run Application things](./images/browser.png" ")

2. Let's do more cURL requests testing, this time let's view our data record for Fred

    ```
    <copy>

        curl -i localhost:8080/things/Fred

    </copy>
    ```

    You should see output for the data entry for Fred

    ![Run Application things](./images/things.fred.png" ")


    Let's view our data record for Barney

    ```
    <copy>

        curl -i localhost:8080/things/Barney

    </copy>
    ```

    You should see output for the data entry for Barney

    ![Run Application things](./images/things.barney.png" ")


3. Now let's try testing to view data entry for Leo


    ```
    <copy>

        curl -i localhost:8080/things/Leo

    </copy>
    ```

    ![Run Application things](./images/things.leo.png" ")


    You should see output "Page Not Found" as we do not have data entry for Leo

You may now **proceed to the next lab**.


## Acknowledgements

    * **Author** - Leo Alvarado, Eddie Ambler Product Management

    * **Contributors** - Tammy Bednar Product Management

    * **Last Update** - Aug 2022.
