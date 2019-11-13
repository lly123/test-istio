#!/usr/bin/env bash
kubectl create sa my-ws-sa -n test-istio
helm install -n ws --namespace test-istio ./chart
