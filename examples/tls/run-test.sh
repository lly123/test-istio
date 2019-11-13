#!/usr/bin/env bash
curl -v -HHost:www.test.com \
  --resolve www.test.com:31390:127.0.0.1 \
  --cacert assets/2_intermediate/certs/ca-chain.cert.pem \
  https://www.test.com:31390/hello
