FROM gcr.io/cloud-builders/kubectl

LABEL version="1.0.0"
LABEL name="kubectl"
LABEL repository="https://github.com/MyJetMarketingBox/kube-restart-pods"
LABEL homepage="https://github.com/MyJetMarketingBox/kube-restart-pods"

LABEL com.github.actions.name="Kubernetes CLI - kubectl"
LABEL com.github.actions.description="Runs kubectl. The config can be provided with the secret KUBE_CONFIG_DATA."
LABEL com.github.actions.icon="terminal"
LABEL com.github.actions.color="blue"

COPY LICENSE README.md /
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
