FROM openjdk:17-jdk-slim

# Установка зависимостей и Docker CLI
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    software-properties-common \
    && curl -fsSL https://get.docker.com | sh \
    && curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '\"' -f4)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

# Проверка установки
RUN docker --version && docker-compose --version

# Копирование приложения
COPY target/simplefordeploy-1.0-SNAPSHOT.jar /app.jar

# Установка точки входа
ENTRYPOINT ["java", "-jar", "/app.jar"]

# Открытие порта
EXPOSE 8080
