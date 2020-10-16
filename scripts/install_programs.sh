#!/bin/bash
set -ueo pipefail

download_verify() {
  # $1 URL
  URL=$1
  # $2 Checksum name
  CHK=$2

  ${CURL} -L "${URL}" -o "${TMP}/${CHK}"
  pushd "${TMP}"
  ${SHA512SUM} -c "${BASE}/checksums/${CHK}"
  ret=$?
  popd
  return $ret
}

install_download() {
  # $1 URL
  URL=$1
  # $2 Checksum name
  CHK=$2
  # $3 Install location
  INS=$3
  # $4 Install name
  BIN=$4

  if download_verify "${URL}" "${CHK}"; then
    pushd "${TMP}"
    ${INSTALL} -C "${CHK}" "${INS}/${BIN}"
    popd
  else
    echo "not installing ${BIN}"
  fi
}

install_git() {
  # $1 URL        
  URL=$1
  # $2 Location
  LOC=$2

  if ! [ -d "${LOC}" ]; then
    ${GIT} clone "${URL}" "${LOC}"
  else
    echo "${LOC} already exists, updating instead"
    pushd "${LOC}"
    ${GIT} pull
    popd
  fi
}

for installer in ${SDIR}/installers/*.sh; do
  ${installer}
done
