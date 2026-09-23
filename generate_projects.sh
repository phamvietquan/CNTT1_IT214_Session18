#!/bin/bash
GROUP="com.rikkei.bank"

echo "Generating config-server..."
curl -s -G https://start.spring.io/starter.zip -d type=maven-project -d language=java -d baseDir=config-server -d groupId=$GROUP -d artifactId=config-server -d dependencies=cloud-config-server -o config-server.zip
unzip -q -o config-server.zip && rm config-server.zip

echo "Generating discovery-server..."
curl -s -G https://start.spring.io/starter.zip -d type=maven-project -d language=java -d baseDir=discovery-server -d groupId=$GROUP -d artifactId=discovery-server -d dependencies=cloud-eureka-server -o discovery-server.zip
unzip -q -o discovery-server.zip && rm discovery-server.zip

echo "Generating api-gateway..."
curl -s -G https://start.spring.io/starter.zip -d type=maven-project -d language=java -d baseDir=api-gateway -d groupId=$GROUP -d artifactId=api-gateway -d dependencies=cloud-gateway,cloud-eureka,actuator -o api-gateway.zip
unzip -q -o api-gateway.zip && rm api-gateway.zip

echo "Generating identity-service..."
curl -s -G https://start.spring.io/starter.zip -d type=maven-project -d language=java -d baseDir=identity-service -d groupId=$GROUP -d artifactId=identity-service -d dependencies=web,data-jpa,mysql,cloud-eureka,cloud-config-client,actuator,validation -o identity-service.zip
unzip -q -o identity-service.zip && rm identity-service.zip

echo "Generating customer-service..."
curl -s -G https://start.spring.io/starter.zip -d type=maven-project -d language=java -d baseDir=customer-service -d groupId=$GROUP -d artifactId=customer-service -d dependencies=web,data-jpa,mysql,cloud-eureka,cloud-config-client,actuator,validation,cloud-feign,cloud-resilience4j -o customer-service.zip
unzip -q -o customer-service.zip && rm customer-service.zip

echo "Generating account-service..."
curl -s -G https://start.spring.io/starter.zip -d type=maven-project -d language=java -d baseDir=account-service -d groupId=$GROUP -d artifactId=account-service -d dependencies=web,data-jpa,mysql,cloud-eureka,cloud-config-client,actuator,validation,cloud-feign,cloud-resilience4j,data-redis,cache -o account-service.zip
unzip -q -o account-service.zip && rm account-service.zip

echo "Generating transaction-service..."
curl -s -G https://start.spring.io/starter.zip -d type=maven-project -d language=java -d baseDir=transaction-service -d groupId=$GROUP -d artifactId=transaction-service -d dependencies=web,data-jpa,mysql,cloud-eureka,cloud-config-client,actuator,validation,cloud-feign,cloud-resilience4j,kafka -o transaction-service.zip
unzip -q -o transaction-service.zip && rm transaction-service.zip

echo "Generating notification-service..."
curl -s -G https://start.spring.io/starter.zip -d type=maven-project -d language=java -d baseDir=notification-service -d groupId=$GROUP -d artifactId=notification-service -d dependencies=web,cloud-eureka,cloud-config-client,actuator,kafka -o notification-service.zip
unzip -q -o notification-service.zip && rm notification-service.zip

echo "Done generating all modules."
