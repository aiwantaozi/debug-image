FROM golang:1.17.10

ENV ARCH=amd64

RUN apt update && \
    apt install -y bash git gcc docker.io vim less file curl wget ca-certificates
RUN if [ "${ARCH}" = "amd64" ]; then \
        curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.30.0; \
    fi
RUN curl -sL https://get.helm.sh/helm-v3.3.0-linux-${ARCH}.tar.gz | tar xvzf - -C /usr/local/bin --strip-components=1