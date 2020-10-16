#!/bin/bash
set -ueo pipefail
# shellcheck disable=2153
_TMP="${TMP}/protoc-gen-go"

# Install `protoc`
VER="1.25.0"
ZF="protoc-gen-go.v${VER}.${OS}.${ARCH}.tar.gz"
URL="https://github.com/protocolbuffers/protobuf-go/releases/download/v${VER}/${ZF}"
download_verify "${URL}" "${ZF}"
mkdir "${_TMP}"
${TAR} xvzf -C "${_TMP}" "${TMP}/${ZF}"
${INSTALL} -C "${_TMP}/protoc-gen-go" "${_LOCAL_BIN}/"
