#!/usr/bin/env bash
kubectl create -n istio-system secret tls istio-ingressgateway-certs \
  --key assets/3_application/private/www.test.com.key.pem \
  --cert assets/3_application/certs/www.test.com.cert.pem
