FROM mcr.microsoft.com/dotnet/sdk:${DOTNET_SDK_VERSION}

# kubectl installation https://kubernetes.io/docs/tasks/tools/install-kubectl/
RUN apt-get -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false update && apt-get install -y apt-transport-https gnupg2 curl
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false update
RUN apt-get install -y kubectl

# kompose installation https://kompose.io/installation/
RUN  curl -L https://github.com/kubernetes/kompose/releases/download/v1.22.0/kompose-linux-amd64 -o kompose
RUN  chmod +x kompose
RUN  mv ./kompose /usr/local/bin/kompose
