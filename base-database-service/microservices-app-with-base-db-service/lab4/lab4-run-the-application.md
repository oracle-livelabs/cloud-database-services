# Run the Application


## Introduction

This lab walks you through the steps to Run the Application Connected to Oracle Base Database Service.

<<<<<<< HEAD
Estimated Time: 20 minutes
=======
Estimated Time: 30 minutes
>>>>>>> upstream/main




### Objectives

-   Configure Microservice Application to Connect to Oracle Base Database Service.

### Prerequisites

This lab requires completion of the following:

* Setting Up Your Tenancy - After Oracle creates your tenancy in OCI, an administrator at your company will need to perform some setup tasks and establish an organization plan for your cloud resources and users.




## Task 1: Test the Application.

1. To test using the live database, replace the generated application-test.yml with this:

   src/test/resources/application-test.yml

       ```
       <copy>

         flyway:
        datasources:
          default:
            locations: classpath:db/migration
            baseline-version: 0
            baseline-on-migrate: true

       </copy>
       ```

2. Run the tests

    ```
    <copy>

      ./gradlew test

    </copy>
    ```

    Then open *build/reports/tests/test/index.html* in a browser to see the results.

## Task 2: Run the Application.

1. To run the application use:

    ```
    <copy>

      MICRONAUT_ENVIRONMENTS=oraclecloud ./gradlew run

    </copy>
    ```

    which will start the application on port 8080.

    You should see output similar to the following, indicating that the database connectivity is all handled automatically, and the Flyway migration runs since the database is determined to be out of date. Also, if you added the Logback logger above, you’ll see the results of the work done by DataPopulator:


    ```
    <copy>

      MICRONAUT_ENVIRONMENTS=oraclecloud ./gradlew run

    </copy>
    ```


    You can run some cURL requests to test the application:

    ```
    <copy>

      curl -i localhost:8080/mytable

    </copy>
    ```
