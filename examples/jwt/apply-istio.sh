#!/usr/bin/env bash
kubectl apply -f ./istio/destination-rule.yaml -n test-istio
kubectl apply -f ./istio/virtual-service.yaml -n test-istio
kubectl apply -f ./istio/gateway.yaml -n test-istio
kubectl apply -f ./istio/policy.yaml -n test-istio
