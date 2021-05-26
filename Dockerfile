FROM alpine:3.10
ENV KC_VERSION="v1.17.3"
ENV HELM_VERSION="v3.1.1"
RUN apk add --no-cache ca-certificates bash git openssh curl nfs-utils zip && \
    wget -q https://storage.googleapis.com/kubernetes-release/release/${KC_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin && \
    wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz && \
    tar -xvf helm-${HELM_VERSION}-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm

WORKDIR /
COPY / /
RUN mkdir /root/.kube && mv config /root/.kube/
CMD bash
