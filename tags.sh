#!/bin/bash

# http://www.googlinux.com/list-all-tags-of-docker-image/index.html
function curlAll() {
  repo="$1"
  i=0
  while [ "$?" == "0" ]; do
    i=$((i+1))
    curl -sS "https://registry.hub.docker.com/v2/repositories/$repo/tags/?page=$i" | jq -r '."results"[]["name"]'
  done
}

curlAll "library/openjdk" | grep 8u | sort
