#!/bin/bash
set -ueo pipefail

# shellcheck source=../functions/installers.sh
source "${FDIR}/installers.sh"

# shellcheck disable=2153
_TMP="${TMP}/protoc-gen-go"
if [ -d "${_TMP}" ]; then
  rm -rf "${_TMP}"
fi

# Install `protoc`
VER="1.25.0"
ZF="protoc-gen-go.v${VER}.${OS}.${ARCH}.tar.gz"
URL="https://github.com/protocolbuffers/protobuf-go/releases/download/v${VER}/${ZF}"
download_verify "${URL}" "${ZF}"
mkdir "${_TMP}"
${TAR} xvzf "${TMP}/${ZF}" -C "${_TMP}"
${INSTALL} -C "${_TMP}/protoc-gen-go" "${_LOCAL_BIN}/"
