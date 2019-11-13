#!/usr/bin/env bash
kubectl delete secret istio-ingressgateway-certs -n istio-system
kubectl delete Gateway gateway -n test-istio
kubectl delete VirtualService virtual-service -n test-istio
kubectl delete DestinationRule destination-rule -n test-istio
kubectl delete Policy policy -n test-istio
helm delete --purge ws
