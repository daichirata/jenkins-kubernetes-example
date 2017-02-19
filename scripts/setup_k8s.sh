#!/bin/bash

set -eu

MINIKUBE=bin/minikube
JENKINS_VOLUME=$(pwd)/k8s/minikube/volumes

render() {
    cat $1 | sed -e "s@__JENKINS_VOLUME__@${JENKINS_VOLUME}@g"
}

render k8s/minikube/jenkins/deployment.yaml | kubectl apply --filename -

kubectl rollout status deployment jenkins-deployment

render k8s/minikube/jenkins/service.yaml | kubectl apply --filename -

open $($MINIKUBE service jenkins-service --url)
