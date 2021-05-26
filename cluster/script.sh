#!/bin/bash
if ! kubectl get namespaces | grep redis-cluster; then
         kubectl create namespace redis-cluster
fi
kubectl apply -f cluster/redis-sts.yaml -n redis-cluster
sleep 20;
kubectl exec -it redis-0 -n redis-cluster -- redis-cli --cluster create --cluster-replicas 1 $(kubectl get pods -n redis-cluster -l app=redis -o jsonpath='{range.items[*]}{.status.podIP}:6379 ')
kubectl apply -f cluster/redis-proxy.yaml -n redis-cluster
