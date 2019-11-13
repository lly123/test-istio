#!/usr/bin/env bash
echo "Call version 1:"
curl -X GET -HHost:www.test.com http://localhost:31380/v1/hello
echo ""
echo "Call version 2:"
curl -X GET -HHost:www.test.com http://localhost:31380/v2/hello
