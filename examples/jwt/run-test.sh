#!/usr/bin/env bash
TOKEN=$(./gen-jwt.py ./key.pem --expire 5)
curl -v -HHost:www.test.com \
  --resolve www.test.com:31390:127.0.0.1 \
  --cacert assets/2_intermediate/certs/ca-chain.cert.pem \
  --header "Authorization: Bearer ${TOKEN}" \
  https://www.test.com:31390/hello
