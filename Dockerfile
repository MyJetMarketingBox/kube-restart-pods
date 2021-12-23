#FROM gcr.io/cloud-builders/kubectl
FROM ubuntu:latest

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl

#LABEL version="1.0.0"
#LABEL name="kubectl"
#LABEL repository="https://github.com/MyJetMarketingBox/kube-restart-pods"
#LABEL homepage="https://github.com/MyJetMarketingBox/kube-restart-pods"

#LABEL com.github.actions.name="Kubernetes CLI - kubectl"
#LABEL com.github.actions.description="Runs kubectl. The config can be provided with the secret KUBE_CONFIG_DATA."
#LABEL com.github.actions.icon="terminal"
#LABEL com.github.actions.color="blue"

COPY LICENSE README.md /
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
