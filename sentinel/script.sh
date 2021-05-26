#!/bin/bash
if ! kubectl get namespaces | grep conviva-redis-sentinel; then
         kubectl create namespace conviva-redis-test
fi
helm repo add bitnami https://charts.bitnami.com/bitnami
#helm install -n conviva-redis-test -f sentinel/Values.yaml --version 10.7.16 redis bitnami/redis
helm install -n conviva-redis-sentinel -f sentinel/Values-enabled.yaml --version 10.7.16 redis bitnami/redis