#!/bin/bash

set -e


if [ "$NAMESPACE" != "null" ];
then
echo "restart in process ..."
echo $NAMESPACE


echo "$KUBE_CONFIG_DATA" | base64 --decode > /tmp/config
export KUBECONFIG=/tmp/config

for i in $(kubectl get deploy -o wide -n $NAMESPACE| grep $IMAGE | awk {'print $1'}); do kubectl delete po -l app=$i; done

POD=$(kubectl get deploy -o wide -n $NAMESPACE| grep $IMAGE | awk {'print $1'})
RN=$(kubectl describe deployment $POD -n $NAMESPACE|grep NewReplicaSet:|awk '{print $2}')
PODS=$(for i in $(kubectl get pod -n $NAMESPACE| grep ${RN}|awk '{print $1}'); do echo $i; done)
echo ${PODS}
kubectl delete pod ${PODS} -n $NAMESPACE

else
echo "Restart is DISABLED, namespase is null"
fi
