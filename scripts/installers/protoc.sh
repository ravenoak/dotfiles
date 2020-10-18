#!/bin/bash
set -ueo pipefail

# shellcheck source=../functions/installers.sh
source "${FDIR}/installers.sh"

# shellcheck disable=2153
TMP_="${TMP}/protoc"
if [ -d "${TMP_}" ]; then
  rm -rf "${TMP_}"
fi

# Install `protoc`
VER="3.13.0"
ZF="protoc-${VER}-${OS}-${MACH}.zip"
URL="https://github.com/protocolbuffers/protobuf/releases/download/v${VER}/${ZF}"
download_verify "${URL}" "${ZF}"
mkdir "${TMP_}"
echo "${UNZIP_} ${TMP}/${ZF} -d ${TMP_}"
"${UNZIP_}" "${TMP}/${ZF}" -d "${TMP_}"
"${INSTALL}" -C "${TMP_}/bin/protoc" "${_LOCAL_BIN}/"
if [ -d "${_LOCAL_INCLUDE}/google/protobuf" ]; then
  echo "Deleting old protobuf files"
  rm -rf "${_LOCAL_INCLUDE}/google/protobuf"
fi
mkdir -p "${_LOCAL_INCLUDE}/google"
cp -r "${TMP_}/include/google/protobuf" "${_LOCAL_INCLUDE}/google/"
