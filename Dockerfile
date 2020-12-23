FROM alpine:3

ENV BASE_URL="https://get.helm.sh"
ENV TAR_FILE="helm-v2.17.0-linux-amd64.tar.gz"

RUN apk add --update --no-cache curl ca-certificates bash && \
    curl -L ${BASE_URL}/${TAR_FILE} |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64 && \
    apk del curl && \
    rm -f /var/cache/apk/*

WORKDIR /apps