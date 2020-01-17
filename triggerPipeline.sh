#!/bin/bash
curl --insecure -H "Content-type: application/json" -d '{"artifacts": [{
  "type": "docker/image",
  "reference": "nginx:'${1}'",
  "name": "nginx",
  "version": "'${1}'"
}]}' 'https://gate.away-spinnaker.armory.io/api/v1/webhooks/webhook/deploy'