FROM maven:3.9.4-amazoncorretto-8-debian-bookworm

WORKDIR /code
COPY . /code

ARG DB_HOST
ARG DB_NAME
ARG DB_USERNAME
ARG DB_HOST

ENV DB_HOST ${DB_HOST}
ENV DB_NAME ${DB_NAME}
ENV DB_USERNAME ${DB_USERNAME}
ENV DB_PASSWORD ${DB_PASSWORD}

RUN mvn clean install -DskipTests=true

EXPOSE 8080

CMD ["java","-jar", "/code/target/JavaWebService-1.0-SNAPSHOT.jar", "server", "/code/config.yml"] 