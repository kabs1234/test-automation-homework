FROM jenkins/jenkins:2.528.2-jdk21
USER root

# Install system dependencies including Chrome
RUN apt-get update && apt-get install -y \
    lsb-release \
    python3 \
    python3-pip \
    wget \
    gnupg \
    ca-certificates

# Install Google Chrome (modern method without apt-key)
RUN wget -q -O /tmp/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt-get install -y /tmp/google-chrome-stable_current_amd64.deb \
    && rm /tmp/google-chrome-stable_current_amd64.deb

# Install Docker
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli

# Install all Python packages
RUN pip3 install --break-system-packages --no-cache-dir \
    robotframework==7.0 \
    robotframework-seleniumlibrary==6.2.0 \
    robotframework-pabot==2.18.0 \
    selenium==4.24.0 \
    browserstack-local \
    browserstack-sdk

USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow json-path-api"

WORKDIR /var/jenkins_home