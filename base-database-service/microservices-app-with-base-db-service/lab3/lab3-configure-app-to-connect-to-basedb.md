# Configure and Build The Microservice Application to Connect to Oracle Base Database Service


## Introduction

This lab walks you through the steps to Configure The Microservice Application to Connect to Oracle Base Database Service.

Estimated Time: 20 minutes




### Objectives

-   Configure Microservice Application to Connect to Oracle Base Database Service.

### Prerequisites

This lab requires completion of the following:

* Setting Up Your Tenancy - After Oracle creates your tenancy in OCI, an administrator at your company will need to perform some setup tasks and establish an organization plan for your cloud resources and users.




## Task 1: Connect your Application Tier to Oracle Base Database Service.

1. In the No-VNC Desktop Click on Activities, search for SQL Developer, Click on SQL Developer

  ![Load SQL Developer](./images/load.sql.dev.png" ")

  ![Click SQL Dev](./images/click.sql.dev.png" ")

  ![SQL Developer](./images/sqldev.png" ")

2. Connect using SQL Developer

    * Select Create New connection Icon

  ![Create Connection](./images/create.connection.png" ")

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

    ![connect using sqldeveloper](./images/connect.png" ")

2. Create the Application schema user, Copy the SQL Command to Create schema user in your sql developer and Click on Run Script

     ```
     <copy>

     CREATE USER MyBaseDB_APP IDENTIFIED BY "WELcome123##";
     GRANT CONNECT, RESOURCE, CREATE SESSION, UNLIMITED TABLESPACE TO MyBaseDB_APP;

     </copy>
     ```
   Create a schema user password (must be at least 12 characters and contain a number and an uppercase letter).

   ![create user](./images/create.user.png" ")

## Task 2: Create the Microservice Application.

1. In the lab, Micronaut CLI is pre-installed in the application tier and we will use the mn command to create a new application. This will create an application that uses Micronaut Data JDBC and has support for Oracle Base Database Service.


    In the No-VNC Desktop Click on Activities and Launch the Linux Terminal

    ![Launch Terminal](./images/terminal.png" ")

    Validate installed Application (micronaut) version

    ![Launch Terminal](./images/terminal.mn.png" ")

    Copy the mn command below to create an application that uses Micronaut with the following configuration:

    * JDK 11 as the Java version.
    * example-basedb as the Name
    * example.basedb as the Base Package
    * Additional Features for oracle, data-jdbc, flyway features


    ```
       <copy> mn create-app example.basedb  \
        --build=gradle --lang=java --jdk=11 \
        --features=data-jdbc,flyway,oracle
       </copy>

    ```

    ![Copy Create App](./images/copy.mn.create.png" ")

    ![Create App](./images/application.created.png" ")


**Your Micronaut Application has been created! You are ready to Launch!**




  > **Note**: You can also create the application using the [Micronaut Launch](https://micronaut.io/launch) in a web browser  by  and perform the following steps:
  ![Micronaut Launch](./images/micronaut.launch.png" ")
      Choose **JDK 11** as the **Java version**, Choose **example-basedb** as the **Name**, Choose **example.basedb** as the **Base Package**, Click the **Add Features** button and select the oracle, data-jdbc, flyway features, Then click **Generate** -> **Download Zip** which will download a zip file you can unzip locally with the created application.




2. Create a Thing entity class to represent database data:

   Create *domain* folder under *src/main/java/example/basedb*

   Download the entity class *Thing.java* from [**This Link**](./files/Thing.java) and Copy the the entity class to this
   *src/main/java/example/basedb/domain/Thing.java*



       ```

       <copy>

       package example.basedb.domain;

       import io.micronaut.core.annotation.Creator;
       import io.micronaut.data.annotation.GeneratedValue;
       import io.micronaut.data.annotation.Id;
       import io.micronaut.data.annotation.MappedEntity;

       @MappedEntity
       public class Thing {

           @Id
           @GeneratedValue
           private Long id;

           private final String name;

           @Creator
           public Thing(String name) {
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

   Create a ThingRepository class to read and write data into the database table named Thing:

   Create *repository* folder under *src/main/java/example/basedb*

   Download the repository class *ThingRepository.java* from [**This Link**](./files/ThingRepository.java) and copy on this directory *src/main/java/example/basedb/repository/ThingRepository.java*

       ```

       <copy>

       package example.basedb.repository;

       import example.basedb.domain.Thing;
       import io.micronaut.core.annotation.NonNull;
       import io.micronaut.data.jdbc.annotation.JdbcRepository;
       import io.micronaut.data.model.query.builder.sql.Dialect;
       import io.micronaut.data.repository.CrudRepository;

       import java.util.List;
       import java.util.Optional;

       @JdbcRepository(dialect = Dialect.ORACLE)
       public interface ThingRepository extends CrudRepository<Thing, Long> {

           @Override
           @NonNull
           List<Thing> findAll();

           Optional<Thing> findByName(String name);
       }


       </copy>

       ```

4. Create a Data populator Class

   Create a **DataPopulator** class to create some example database entries when the application starts:

   Download the Data populator Class *DataPopulator.java* from [**This Link**](./files/DataPopulator.java) and copy  on this directory *src/main/java/example/basedb/DataPopulator.java*

       ```
       <copy>

        package example.basedb;

        import example.basedb.domain.Thing;
        import example.basedb.repository.ThingRepository;
        import io.micronaut.context.annotation.Requires;
        import io.micronaut.context.event.StartupEvent;
        import io.micronaut.runtime.event.annotation.EventListener;
        import jakarta.inject.Singleton;

        import javax.transaction.Transactional;
        import java.util.Arrays;

        @Singleton
        @Requires(notEnv = "test")
        public class DataPopulator {

        private final ThingRepository thingRepository;

        public DataPopulator(ThingRepository thingRepository) {
         this.thingRepository = thingRepository;
        }

        @EventListener
        @Transactional
        void init(StartupEvent event) {
         // clear out any existing data
         thingRepository.deleteAll();

         // create data
         Thing fred = new Thing("Fred");
         Thing barney = new Thing("Barney");
         thingRepository.saveAll(Arrays.asList(fred, barney));
        }
        }


       </copy>

       ```

5. Create a Controller Class

   Create a **ThingController** class to view persisted data:

   Create *controller* folder under *src/main/java/example/basedb*

   Download the controller class *ThingController.java* from [**This Link**](./files/ThingController.java) and copy on this directory *src/main/java/example/basedb/controller/ThingController.java*

       ```
       <copy>

        package example.basedb.controller;

        import example.basedb.domain.Thing;
        import example.basedb.repository.ThingRepository;
        import io.micronaut.http.annotation.Controller;
        import io.micronaut.http.annotation.Get;
        import io.micronaut.scheduling.TaskExecutors;
        import io.micronaut.scheduling.annotation.ExecuteOn;

        import javax.validation.constraints.NotBlank;
        import java.util.List;
        import java.util.Optional;

        @Controller("/things")
        @ExecuteOn(TaskExecutors.IO)
        class ThingController {

        private final ThingRepository thingRepository;

        ThingController(ThingRepository thingRepository) {
         this.thingRepository = thingRepository;
        }

        @Get
        List<Thing> all() {
         return thingRepository.findAll();
        }

        @Get("/{name}")
        Optional<Thing> byName(@NotBlank String name) {
         return thingRepository.findByName(name);
        }
        }

        </copy>

        ```




## Task 3: Configure the microservice application to connect to Oracle Base Database Service.

1. Create configuration

   Create a new Flyway migration SQL script in *src/main/resources/db/migration/V1__create-schema.sql* You can download the sql script from [**This Link**](./files/V1__create-schema.sql) *ensure to save file with* *.sql* *extension*

       ```
       <copy>

       CREATE TABLE "THING" ("ID" NUMBER(19) PRIMARY KEY NOT NULL,"NAME" VARCHAR(255) NOT NULL);
       CREATE SEQUENCE "THING_SEQ" MINVALUE 1 START WITH 1 NOCACHE NOCYCLE;

       </copy>

       ```

       Edit *src/main/resources/logback.xml* and add the following (anywhere in the <configuration> element) to monitor the SQL queries that Micronaut Data performs:

       ```
       <copy>

       <logger name='io.micronaut.data.query' level='debug' />

       </copy>

       ```

2. Add and configure the Application Datasources with the Oracle Base Database Service connection information and credentials

   Replace the content of the *application.yml* from *src/main/resources/application.yml* with below:

   Ensure to update the url value with your specific environment values

    * [dbhostname IP]
    * [port]
    * [database service name]

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
            url: jdbc:oracle:thin:@[dbhostnameIP]:[port]/[dbservice name]
            driverClassName: oracle.jdbc.OracleDriver
            username: MyBaseDB_APP
            password: WELcome123##
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



3. From the terminal, add the following entries to your /etc/hosts

   As opc, run *sudo -s* to switch to root

   ![sudo root](./images/sudo.png" ")

   run *vi /etc/hosts* and add the following entries:

      ```
       <copy>

       104.18.190.9 services.gradle.org plugins.gradle.org
       104.18.165.99 downloads.gradle-dn.com
       151.101.124.215 repo.maven.apache.org

       </copy>

      ```

    As opc, validate your /etc/hosts to confirm following entries are added

    ![View etc hosts](./images/etc.hosts.png" ")

You may now **proceed to the next lab**.


## Acknowledgements

* **Author** - Leo Alvarado, Eddie Ambler Product Management

* **Contributors** - Tammy Bednar Product Management

* **Last Update** - Sep 2022.
