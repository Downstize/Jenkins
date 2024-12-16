FROM jenkins/inbound-agent:latest

USER root

# Обновляем список пакетов и устанавливаем зависимости
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    gnupg

# Добавляем официальный GPG-ключ Docker
RUN install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg

# Добавляем репозиторий Docker
RUN echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bullseye stable" > /etc/apt/sources.list.d/docker.list

# Обновляем список пакетов и устанавливаем Docker
RUN apt-get update && apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

USER jenkins
