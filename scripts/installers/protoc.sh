#!/bin/bash
set -ueo pipefail
# shellcheck disable=2153
_TMP="${TMP}/protoc"

# Install `protoc`
VER="3.13.0"
ZF="protoc-${VER}-${OS}-${MACH}.zip"
URL="https://github.com/protocolbuffers/protobuf/releases/download/v${VER}/${ZF}"
download_verify "${URL}" "${ZF}"
mkdir "${_TMP}"
${UNZIP} "${TMP}/${ZF}" -d "${_TMP}"
${INSTALL} -C "${_TMP}/bin/protoc" "${_LOCAL_BIN}/"
if [ -d "${_LOCAL_INCLUDE}/google/protobuf" ]; then
  echo "Deleting old protobuf files"
  rm -rf "${_LOCAL_INCLUDE}/google/protobuf"
fi
mkdir -p "${_LOCAL_INCLUDE}/google"
cp -r "${_TMP}/include/google/protobuf" "${_LOCAL_INCLUDE}/google/"
