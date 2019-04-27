#!/bin/bash

set -u

__go() {
  img="$1"

  echo "$img"
  docker run --rm --cpuset-cpus 1 -m 512m "$img"
  docker run --rm --cpuset-cpus 1 -m 256m "$img"
  docker run --rm "$img"
}

__build() {
  img="$1"
  df="$2"
  docker build -f "$df" -t "$img" .
}

__rm() {
  img="$1"

  docker rmi "$img"
}

__build "jvm-test-correto8u212" "DockerfileCorreto8u212"
__build "jvm-test-open8u212" "DockerfileOpen8u212"
__build "jvm-test-correto8u192" "DockerfileCorreto8u192"
__build "jvm-test-open8u181" "DockerfileOpen8u181"
__build "jvm-test-open8u102" "DockerfileOpen8u102"

__go "jvm-test-correto8u212"
__go "jvm-test-open8u212"
__go "jvm-test-correto8u192"
__go "jvm-test-open8u181"
__go "jvm-test-open8u102"

__rm "jvm-test-correto8u212"
__rm "jvm-test-open8u212"
__rm "jvm-test-correto8u192"
__rm "jvm-test-open8u181"
__rm "jvm-test-open8u102"
