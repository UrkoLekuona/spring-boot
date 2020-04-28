FROM ubuntu

RUN mkdir /app

# Copiar mi proyecto
ADD . /app

# Instalar Maven
RUN apt update
RUN apt install -y maven

# Compilar la aplicación
WORKDIR /app
RUN mvn clean package
RUN cp target/*.jar /app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]
