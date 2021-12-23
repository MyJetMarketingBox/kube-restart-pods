#!/bin/bash

set -e

echo "$KUBE_CONFIG_DATA" | base64 --decode > /tmp/config
export KUBECONFIG=/tmp/config

for i in $(kubectl get deploy -o wide -n $NAMESPACE| grep $IMAGE | awk {'print $1'}); do kubectl delete po -l app=$i; done

#$(kubectl get deploy -o wide -n $NAMESPACE| grep $IMAGE | awk {'print $1'})
kubectl delete po -l app=marketing-box-affiliate-service
#kubectl get pods

#echo $NAMESPACE

