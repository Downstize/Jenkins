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
ENV JENKINS_SECRET=6bcd022d165755b7774540f4ddd5f0d2899b283dadb24681c0591b545ac6d128
ENV JENKINS_AGENT_NAME=GuestAgent2

# Проверить установку Docker
RUN docker --version

USER jenkins
