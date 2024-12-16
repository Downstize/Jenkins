FROM jenkins/inbound-agent:latest

USER root

# Установим необходимые зависимости
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    software-properties-common

# Добавим GPG-ключ Docker
RUN install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg

# Добавим репозиторий Docker
RUN echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" > /etc/apt/sources.list.d/docker.list

# Установим Docker CLI
RUN curl -fsSL https://get.docker.com | sh

# Установим Docker Compose (отдельный бинарник)
RUN curl -L "https://github.com/docker/compose/releases/download/v2.21.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# Проверим установку
RUN docker --version && docker compose version

USER jenkins
