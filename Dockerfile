FROM jenkinsci/jnlp-slave:alpine

ENV KUBE_LATEST_VERSION="v1.26.0"

USER root
WORKDIR /
RUN apk add --update -t deps curl tar gzip ca-certificates git

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl

RUN apk del --purge deps

USER jenkins
