#!/bin/bash -xe

# inspired by: https://github.com/kubernetes-sigs/etcdadm/blob/master/etcd-manager/dev/set-version.sh

VERSION="$1"

hack/validate-version.sh "${VERSION}"

echo "${VERSION}" > version.txt
