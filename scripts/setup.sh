#!/bin/bash

set -eu

MINIKUBE_VERSION=v0.16.0
MINIKUBE=bin/minikube

if [[ ! -f $MINIKUBE ]]
then
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/$MINIKUBE_VERSION/minikube-darwin-amd64 \
        && chmod +x minikube \
        && mv minikube $MINIKUBE
fi

KUBECTL_VERSION=v1.5.3
KUBECTL=bin/kubectl

if [[ ! -f $KUBECTL ]]
then
    curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/darwin/amd64/kubectl \
        && chmod +x kubectl \
        && mv kubectl $KUBECTL
fi

$MINIKUBE status | grep Running || $MINIKUBE start

$KUBECTL config use-context minikube
eval "$($MINIKUBE docker-env)"
