#!/bin/bash -xe

VERSION="$1"

if [[ ! "${VERSION}" =~ ^v([0-9]+[.][0-9]+)[.]([0-9]+)(-(alpha|beta)[.]([0-9]+))?$ ]]; then
  echo "Version ${VERSION} must be 'vX.Y.Z', 'vX.Y.Z-alpha.N', or 'vX.Y.Z-beta.N'"
  exit 1
fi

if [ "$(git tag -l "${VERSION}")" ]; then
  echo "Tag ${VERSION} already exists"
  exit 0
fi
