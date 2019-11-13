#!/usr/bin/env bash
docker build . -t simple-web-server
#docker tag simple-web-server:latest quay.io/wework/simple-web-server:latest
#docker push quay.io/wework/simple-web-server:latest
