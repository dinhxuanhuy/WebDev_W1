FROM maven:3.8.1-openjdk-17-slim AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM tomcat:9.0.108-jdk17-corretto
# Xóa các ứng dụng mặc định của tomcat
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /app/target/Web_WEEK_1.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]