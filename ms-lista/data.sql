<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>3.3.0</version>
		<relativePath /> <!-- lookup parent from repository -->
	</parent>
	<groupId>cl.usach.ms_lista</groupId>
	<artifactId>cl.usachLista</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<name>cl.usachLista</name>
	<description>Listas</description>
	<properties>
		<java.version>17</java.version>
	</properties>
	<dependencies>
		<!-- https://mvnrepository.com/artifact/org.apache.httpcomponents.client5/httpclient5 -->
		<dependency>
			<groupId>org.apache.httpcomponents.client5</groupId>
			<artifactId>httpclient5</artifactId>
			<version>5.3.1</version>
		</dependency>
		<!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-databind -->
<!--		<dependency>-->
<!--			<groupId>com.fasterxml.jackson.core</groupId>-->
<!--			<artifactId>jackson-databind</artifactId>-->
<!--			<version>2.11.4</version>-->
<!--		</dependency>-->
		<!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-databind -->
<!--		<dependency>-->
<!--			<groupId>com.fasterxml.jackson.core</groupId>-->
<!--			<artifactId>jackson-core</artifactId>-->
<!--			<version>2.11.4</version>-->
<!--		</dependency>-->
		<!--		<dependency>-->
		<!--			<groupId>org.springframework.boot</groupId>-->
		<!--			<artifactId>spring-boot-starter-data-jpa</artifactId>-->
		<!--		</dependency>-->
		<!--		<dependency>-->
		<!--			<groupId>org.springframework.cloud</groupId>-->
		<!--			<artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>-->
		<!--			<version>4.1.1</version>-->
		<!--		</dependency>-->
		<!--		<dependency>-->
		<!--			<groupId>org.springframework.cloud</groupId>-->
		<!--			<artifactId>spring-cloud-starter-bootstrap</artifactId>-->
		<!--		</dependency>-->
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
		</dependency>
		<!--		<dependency>-->
		<!--			<groupId>org.postgresql</groupId>-->
		<!--			<artifactId>postgresql</artifactId>-->
		<!--			<scope>runtime</scope>-->
		<!--		</dependency>-->
		<dependency>
			<groupId>org.projectlombok</groupId>
			<artifactId>lombok</artifactId>
			<optional>true</optional>
		</dependency>
		<!--		<dependency>-->
		<!--			<groupId>org.springframework.cloud</groupId>-->
		<!--			<artifactId>spring-cloud-starter-openfeign</artifactId>-->
		<!--		</dependency>-->
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-test</artifactId>
			<scope>test</scope>
		</dependency>
		<!--		<dependency>-->
		<!--			<groupId>org.springframework.cloud</groupId>-->
		<!--			<artifactId>spring-cloud-config-client</artifactId>-->
		<!--			<version>4.1.1</version>-->
		<!--		</dependency>-->
		<!--	<dependency>-->
		<!--		<groupId>com.mingeso</groupId>-->
		<!--		<artifactId>gateway-server</artifactId>-->
		<!--		<version>0.0.1-SNAPSHOT</version>-->
		<!--	</dependency>-->
		<!--	<dependency>-->
		<!--		<groupId>com.mingeso</groupId>-->
		<!--		<artifactId>gateway-server</artifactId>-->
		<!--		<version>0.0.1-SNAPSHOT</version>-->
		<!--	</dependency>-->
	</dependencies>
	<!--	<dependencyManagement>-->
	<!--		<dependencies>-->
	<!--			<dependency>-->
	<!--				<groupId>org.springframework.cloud</groupId>-->
	<!--				<artifactId>spring-cloud-dependencies</artifactId>-->
	<!--				<version>${spring-cloud.version}</version>-->
	<!--				<type>pom</type>-->
	<!--				<scope>import</scope>-->
	<!--			</dependency>-->
	<!--		</dependencies>-->
	<!--	</dependencyManagement>-->
	<build>
		<plugins>
			<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
				<configuration>
					<excludes>
						<exclude>
							<groupId>org.projectlombok</groupId>
							<artifactId>lombok</artifactId>
						</exclude>
					</excludes>
				</configuration>
			</plugin>
		</plugins>
	</build>
</project>
