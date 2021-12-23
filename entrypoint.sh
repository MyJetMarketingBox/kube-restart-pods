#!/bin/sh

set -e

echo "$KUBE_CONFIG_DATA" | base64 --decode > /tmp/config
export KUBECONFIG=/tmp/config
kubectl get deploy -o wide -n $NAMESPACE
kubectl get deploy -o wide -n $NAMESPACE| grep $IMAGE
#for i in $(kubectl get deploy -o wide -n $NAMESPACE| grep $IMAGE | awk {'print $1'}); do kubectl delete po -l app=$i; done
