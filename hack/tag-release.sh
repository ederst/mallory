#!/bin/bash -xe

# inspired by: https://github.com/kubernetes-sigs/etcdadm/blob/master/etcd-manager/dev/tag-release.sh

GIT_REMOTE_NAME="${1:-origin}"
VERSION="$(cat version.txt)"

hack/validate-version.sh "${VERSION}"

git tag -a -m "Release ${VERSION}" "${VERSION}"
git push "${GIT_REMOTE_NAME}" "${VERSION}"
