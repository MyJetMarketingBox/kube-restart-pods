#!/bin/sh

set -e


if [ "$NAMESPACE" != "null" ];
then
echo "restart in process ..."
echo $NAMESPACE

# Extract the base64 encoded config data and write this to the KUBECONFIG
echo "$KUBE_CONFIG_DATA" | base64 --decode > /tmp/config
NAMESPACE=marketing-box
export KUBECONFIG=/tmp/config

TEST=($(for i in $(kubectl get deploy -o wide -n $NAMESPACE | grep $IMAGE | awk {'print $1'}); do echo $i; done))
RN=($(for i in ${TEST[@]}; do kubectl describe deployment $i -n  $NAMESPACE|grep NewReplicaSet:|awk '{print $2}'; done))
ARR=($(for i in ${RN[@]}; do kubectl get pods -n $NAMESPACE | grep $i | awk {'print $1'}; done))
for i in ${ARR[@]}; do kubectl delete pod $i -n $NAMESPACE; done

else
echo "Restart is DISABLED, namespase is null"
fi
