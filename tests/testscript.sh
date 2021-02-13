#!/usr/bin/env bash

echo "A test (with errors) to ensure everything is setup properly.."

source /etc/os-release

echo ${PRETTY_NAME}

echo ${VERSION_ID} | sed s/20//

echo "${version_id}"

echo $((${version_id} + 1))
