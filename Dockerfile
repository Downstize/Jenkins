FROM jenkins/inbound-agent:latest

USER root

RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    software-properties-common

# Установить Docker CLI
RUN curl -fsSL https://get.docker.com | sh

# Добавить Jenkins URL и Agent Secret как переменные среды
ENV JENKINS_URL=http://jenkins-server:8080
ENV JENKINS_SECRET=d52a15f2332a89e37e0188a34ce23644269a237cc8f8bae9b9dca216af3f4da4
ENV JENKINS_AGENT_NAME=GuestAgent

# Проверить установку Docker
RUN docker --version

USER jenkins
