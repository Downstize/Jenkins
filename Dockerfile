FROM jenkins/inbound-agent:latest

USER root

# Установим необходимые зависимости
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    gnupg

# Добавим GPG-ключ Docker
RUN install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg

# Добавим репозиторий Docker для Debian bookworm
RUN echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" > /etc/apt/sources.list.d/docker.list

# Установим Docker и плагины
RUN apt-get update && apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

USER jenkins
