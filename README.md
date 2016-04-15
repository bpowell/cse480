# CSE480 Project

## Code
Webapp is located in the [webapp](webapp/) directory. You will need a ds.properties (or what ever you want to name it) for the application to connect to Postgresql. The format for the file is given by [sample.ds.properties](sample.ds.properties).

## Requirements
1. Tomcat 7+
2. Java 7+
3. Postgresql 9.3+
4. Maven 3+

## How to Build
For WebApp:

```bash
mvn clean package
```

To create the database schema using maven, issue the following command:

```bash
mvn clean package -Ddb=create
```

## How to deploy
For WebApp:

```bash
cp target/cse480.war $TOMCAT_HOME/webapps
```

## Postgresql Setup
These instructions are assuming you are using Linux

1. Install postgresql with your package manager
2. `sudo su - postgres` to switch as the postgres user
3. `psql` to run the postgres client
4. `create user cse480 with password 'cse480';` to create the database user
5. `create database cse480 owner cse480;` to create the database
6. `<ctrl+d>` to exit out of psql and then `exit` as the postgres user
7. To create the schema developed run the following command `mvn clean package -Ddb=create`
