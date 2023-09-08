FROM maven:3.9.4-amazoncorretto-8-debian-bookworm

WORKDIR /code
COPY . /code

RUN mvn clean install -DskipTests=true

EXPOSE 8080

CMD ["java","-jar", "/code/target/JavaWebService-1.0-SNAPSHOT.jar", "server", "/code/config.yml"] 