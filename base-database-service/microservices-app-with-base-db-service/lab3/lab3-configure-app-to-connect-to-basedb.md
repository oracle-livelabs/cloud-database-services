# Configure The Microservice Application to Connect to Oracle Base Database Service


## Introduction

This lab walks you through the steps to Configure The Microservice Application to Connect to Oracle Base Database Service.

Estimated Time: 15 minutes




### Objectives

-   Configure Microservice Application to Connect to Oracle Base Database Service.

### Prerequisites

This lab requires completion of the following:

* Setting Up Your Tenancy - After Oracle creates your tenancy in OCI, an administrator at your company will need to perform some setup tasks and establish an organization plan for your cloud resources and users.




## Task 1: Connect your Application Tier to Oracle Base Database Service.

1. Connect using SQL Developer
2. Create the Application schema user

   CREATE USER micronautdemo IDENTIFIED BY "XXXXXXXXX";
   GRANT CONNECT, RESOURCE TO micronautdemo;
   GRANT UNLIMITED TABLESPACE TO micronautdemo;

   Create a schema user password (must be at least 12 characters and contain a number and an uppercase letter) and replace the text "XXXXXXXXX" with that password.

## Task 2: Write the Microservice Application.

1. Create an application using Micronaut Launch.


   ```<copy> mn create-app example.micronaut.micronautguide
    --build=gradle --lang=java --jdk=11 \
    --features=data-jdbc,flyway,oracle-cloud-atp,testcontainers </copy>```



   If you don’t specify the --build argument, Gradle is used as the build tool.
   If you don’t specify the --lang argument, Java is used as the language.
   The previous command creates a Micronaut application with the default package example.micronaut in a directory named micronautguide.

   If you have an existing Micronaut application and want to add the functionality described here, you can view the dependency and configuration changes from the specified features and apply those changes to your application.

2. Create an Entity Class

   Create a MyTable entity class to represent database data:




## Task 3: Configure the microservice application to connect to Oracle Base Database Service.
