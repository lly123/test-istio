#!/usr/bin/env bash
kubectl delete sa my-ws-sa -n test-istio
kubectl delete Gateway gateway -n test-istio
kubectl delete VirtualService virtual-service -n test-istio

kubectl delete MeshPolicy default
kubectl delete DestinationRule default -n istio-system
kubectl delete DestinationRule default -n cn-mx
kubectl delete ClusterRbacConfig default -n test-istio

kubectl delete ServiceRole service-role -n test-istio
kubectl delete ServiceRoleBinding service-role-binding -n test-istio
kubectl delete ServiceRole service-role-mysql -n cn-mx
kubectl delete ServiceRoleBinding service-role-binding-mysql -n cn-mx

helm delete --purge ws
