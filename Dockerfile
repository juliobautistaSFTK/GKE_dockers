# Usa una imagen base con Java 8
FROM openjdk:8-jdk-alpine

# Establecer el directorio de trabajo
WORKDIR /app

# Instalar Maven 3.3
RUN apk update && apk add --no-cache maven bash

# Verificar las versiones de Java y Maven
RUN java -version
RUN mvn -version

# Copiar el código fuente del proyecto en el contenedor
COPY . /app

# Mantener el contenedor en ejecución
CMD ["tail", "-f", "/dev/null"]
