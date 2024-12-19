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
ENV JENKINS_SECRET=your-agent-secret
ENV JENKINS_AGENT_NAME=my-agent

# Проверить установку Docker
RUN docker --version

USER jenkins
