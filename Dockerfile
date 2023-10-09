FROM debian:bookworm

RUN apt-get update &&\
    apt-get install -y curl percona-toolkit &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

ARG ALP_VERSION=1.0.21
RUN curl -Lo /tmp/alp.tar.gz https://github.com/tkuchiki/alp/releases/download/v${ALP_VERSION}/alp_linux_amd64.tar.gz &&\
    tar -xvf /tmp/alp.tar.gz -C /tmp &&\
    mv /tmp/alp /usr/local/bin/alp &&\
    rm /tmp/*

WORKDIR /workspace

