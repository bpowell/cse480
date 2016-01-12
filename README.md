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

## How to deploy
For WebApp:

```bash
cp target/cse480.war $TOMCAT_HOME/webapps
```
