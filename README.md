# docker-java-maven-template
This repo includes the template of a maven based Java project and a Dockerfile to quickly build and run the application.
It is based on the `openjdk:8-jre-alpine` and `maven:3.6.3-jdk-8-slim` docker images and the [quickstart](https://maven.apache.org/archetypes/maven-archetype-quickstart/) (`maven-archetype-quickstart`) archetype.
The resulting image is roughtly 85mbyte in size.

## Building the image
`docker build -t example .`

## Run the app
`docker run example`

## Important notes
The Dockerfile requires several arguments to start the application. These are obviously tied to the current project setup (`groupId`, `artifactId`, `jar path`, `version`).
**If you plan to change these please update the [variables](/Dockerfile#L8-L11) in the Dockerfile as well**.
