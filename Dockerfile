FROM maven:3.6.3-jdk-8-slim as build
WORKDIR /app
COPY . /app
RUN mvn install
RUN mvn package

FROM openjdk:8-jre-alpine
ENV MAIN_CLASS=at.int32.example.App
ENV ARTIFACT_ID=example
ENV ARTIFACT_VERSION=0.0.1-SNAPSHOT
ENV ARTIFACT_NAME=$ARTIFACT_ID-$ARTIFACT_VERSION.jar
WORKDIR /app
COPY --from=build /app/target/$ARTIFACT_NAME .
RUN ls -l /app
CMD ["sh", "-c", "java -cp ${ARTIFACT_NAME} ${MAIN_CLASS}"]