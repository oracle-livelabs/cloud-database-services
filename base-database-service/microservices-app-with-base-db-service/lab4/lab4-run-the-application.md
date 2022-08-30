# Run the Application


## Introduction

This lab walks you through the steps to Run the Application Connected to Oracle Base Database Service.

Estimated Time: 15 minutes




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

## Task 2: Run the Application.

1. Create an application using Micronaut Launch in a web browser and perform the following steps:
