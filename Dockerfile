FROM maven:3.8.1-openjdk-17-slim AS builder
WORKDIR /build
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM tomcat:9.0.108-jdk17-corretto
# Xóa các ứng dụng mặc định của tomcat
RUN rm -rf /usr/local/tomcat/webapps/*
# Copy WAR file từ builder stage
COPY --from=builder /build/target/Web_WEEK_1.war /usr/local/tomcat/webapps/ROOT.war
# Expose port cho Render
EXPOSE 8080
# Chạy Tomcat
CMD ["catalina.sh", "run"]