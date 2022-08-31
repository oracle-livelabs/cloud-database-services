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

    * Select Create New connection Icon
    * Enter a Name for the Connection
    * For the Database Type select Oracle
    * For the Username enter Sys
    * Enter the Sys password
    * For the Role select SYSDBA
    * For Hostname enter <Host IP>
    * For Port enter 1521
    * For Service Name Enter
           <Database Service Name>
    * Test & Save connection

    ![connect using sqldeveloper](./images/sql-developer.png" ")

2. Create the Application schema user

     ```
     <copy>

     CREATE USER MyBaseDB_APP IDENTIFIED BY "WELcome123#!";
     GRANT CONNECT, RESOURCE, CREATE SESSION, UNLIMITED TABLESPACE TO MyBaseDB_APP;

     </copy>
     ```
   Create a schema user password (must be at least 12 characters and contain a number and an uppercase letter).

   ![create user](./images/create-user.png" ")

## Task 2: Create the Microservice Application.

1. Create an application using Micronaut Launch in a web browser and perform the following steps:

    * Choose JDK 11 as the Java version.
    * Choose example-basedb as the Name
    * Choose example.basedb as the Base Package
    * Click the Features button and select the oracle, data-jdbc, flyway features
    * Then click Generate -> Download Zip which will download a zip file you can unzip locally with the created application.


   ![Micronaut Launch](./images/micronaut-launch.png" ")


    If you have the Micronaut CLI installed (see the Installation instructions for how to install) you can use the mn command to create a new application. This will create an application that uses Micronaut Data JDBC and has support for Oracle Base Database Service.


       ```
       <copy> mn create-app example.basedb
        --build=gradle --lang=java --jdk=11 \
        --features=data-jdbc,flyway,oracle
       </copy>

        ```



    If you don’t specify the --build argument, Gradle is used as the build tool.
    If you don’t specify the --lang argument, Java is used as the language.
    If you have an existing Micronaut application and want to add the functionality described here, you can view the dependency and configuration changes from the specified features and apply those changes to your application.

2. Create an Entity Class

   Create a MyTable entity class to represent database data:

   Create the entity class on this directory
   *src/main/java/example/basedb/domain/MyTable.java*

       ```

       <copy>

              package example.basedb.domain;

              import io.micronaut.core.annotation.Creator;
              import io.micronaut.data.annotation.GeneratedValue;
              import io.micronaut.data.annotation.Id;
              import io.micronaut.data.annotation.MappedEntity;

              @MappedEntity
              public class MyTable {

              @Id
              @GeneratedValue
              private Long id;

              private final String name;

              @Creator
              public MyTable(String name) {
                 this.name = name;
              }

              public String getName() {
                 return name;
              }

              public Long getId() {
                 return id;
              }

              public void setId(Long id) {
                 this.id = id;
              }
              }

        </copy>

        ```

3. Create a Repository class

   Create a MyTableRepository class to read and write MyTable database data:

   Create the repository class on this directory *src/main/java/example/basedb/repository/MyTableRepository.java*

       ```

       <copy>

              package example.basedb.repository;

              import example.basedb.domain.MyTable;
              import io.micronaut.core.annotation.NonNull;
              import io.micronaut.data.jdbc.annotation.JdbcRepository;
              import io.micronaut.data.model.query.builder.sql.Dialect;
              import io.micronaut.data.repository.CrudRepository;

              import java.util.List;
              import java.util.Optional;

              @JdbcRepository(dialect = Dialect.ORACLE)
              public interface MyTableRepository extends CrudRepository<MyTable, Long>

              {

                  @Override
                  @NonNull
                  List<MyTable> findAll();

                  Optional<MyTable> findByName(String name);
              }


       </copy>

       ```

4. Create a Data populator Class

   Create a DataPopulator class to create some example database entries when the application starts:

   Create the Data populator Class on this directory *src/main/java/example/basedb/DataPopulator.java*

       ```
       <copy>

              package example.basedb;

              import example.basedb.domain.MyTable;
              import example.basedb.repository.MyTableRepository;
              import io.micronaut.context.annotation.Requires;
              import io.micronaut.context.event.StartupEvent;
              import io.micronaut.runtime.event.annotation.EventListener;
              import jakarta.inject.Singleton;

              import javax.transaction.Transactional;
              import java.util.Arrays;

              @Singleton
              @Requires(notEnv = "test")
              public class DataPopulator {

              private final MyTableRepository mytableRepository;

              public DataPopulator(MyTableRepository mytableRepository) {
               this.mytableRepository = mytableRepository;
              }

              @EventListener
              @Transactional
              void init(StartupEvent event) {
               // clear out any existing data
               mytableRepository.deleteAll();

               // create data
               MyTable dustin = new MyTable("Dustin");
               MyTable vecna = new MyTable("Vecna");
               mytableRepository.saveAll(Arrays.asList(dustin, vecna));
              }
              }


       </copy>

       ```

5. Create a Controller Class

   Create a MyTableController class to view persisted data:

   Create the controller class on this directory *src/main/java/example/basedb/controller/MyTableController.java*

       ```
       <copy>

              package example.basedb.controller;

              import example.basedb.domain.MyTable;
              import example.basedb.repository.MyTableRepository;
              import io.micronaut.http.annotation.Controller;
              import io.micronaut.http.annotation.Get;
              import io.micronaut.scheduling.TaskExecutors;
              import io.micronaut.scheduling.annotation.ExecuteOn;

              import javax.validation.constraints.NotBlank;
              import java.util.List;
              import java.util.Optional;

              @Controller("/MyTables")
              @ExecuteOn(TaskExecutors.IO)
              class MyTableController {

                  private final MyTableRepository mytableRepository;

                  MyTableController(MyTableRepository mytableRepository) {
                      this.mytableRepository = mytableRepository;
                  }

                  @Get
                  List<MyTable> all() {
                      return mytableRepository.findAll();
                  }

                  @Get("/{name}")
                  Optional<MyTable> byName(@NotBlank String name) {
                      return mytableRepository.findByName(name);
                  }
              }

        </copy>

        ```




## Task 3: Configure the microservice application to connect to Oracle Base Database Service.

1. Create configuration

   Create a new Flyway migration SQL script in *src/main/resources/db/migration/V1_create-schema.sql* and add the following:

       ```
       <copy>

       CREATE TABLE "MyTable" ("ID" NUMBER(19) PRIMARY KEY NOT NULL,"NAME" VARCHAR(255) NOT NULL);
       CREATE SEQUENCE "MyTable_SEQ" MINVALUE 1 START WITH 1 NOCACHE NOCYCLE;

       </copy>

       ```

       Edit *src/main/resources/logback.xml* and add the following (anywhere in the <configuration> element) to monitor the SQL queries that Micronaut Data performs:

       ```
       <copy>

       <logger name='io.micronaut.data.query' level='debug' />

       </copy>

       ```

2. Add and configure the Application Datasources with the Oracle Base Database Service connection information and credentials

   Add the following details in the application.yml from *src/main/resources/application.yml*

      ```
      <copy>

        micronaut:
          application:
            name: exampleBasedb
          executors:
            io:
              type: fixed
              nThreads: 75
        datasources:
          default:
            url: jdbc:oracle:thin:@(database connection string)
            driverClassName: oracle.jdbc.OracleDriver
            username: MyBaseDB_APP
            password: WELcome123#!
            dialect: ORACLE
            data-source-properties:
             oracle:
              jdbc:
               fanEnabled: false
        flyway:
          datasources:
            default:
              enabled: true
        netty:
          default:
            allocator:
              max-order: 3

       </copy>

       ```
