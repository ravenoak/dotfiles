#!/bin/bash
set -ueo pipefail

BASE="$(dirname "$0")/.."
SDIR="${BASE}/scripts"

# shellcheck source=../configs/default.sh
source "${BASE}/configs/default.sh"

CURL=$(command -v curl)
if ! [ -x "${CURL}" ]; then echo 'curl not installed'; exit 1; fi

GIT=$(command -v git)
if ! [ -x "${GIT}" ]; then echo 'git not installed'; exit 1; fi

UNAME=$(command -v uname)
if ! [ -x "${UNAME}" ]; then echo 'uname not installed'; exit 1; fi

SHA512SUM=$(command -v sha512sum)
if ! [ -x "${SHA512SUM}" ]; then echo 'sha512sum not installed'; exit 1; fi

INSTALL=$(command -v install)
if ! [ -x "${INSTALL}" ]; then echo 'install not installed'; exit 1; fi

UNZIP=$(command -v unzip)
if ! [ -x "${UNZIP}" ]; then echo 'unzip not installed'; exit 1; fi

TAR=$(command -v tar)
if ! [ -x "${TAR}" ]; then echo 'tar not installed'; exit 1; fi

MACH=$(uname -m)
if [ "${MACH}" == 'x86_64' ]; then
  ARCH='amd64'
else
  ARCH='unknown'
fi
OS=$(uname -s | tr '[:upper:]' '[:lower:]')

DIRS=(
"${_LOCAL}"
"${_LOCAL_BIN}"
"${_LOCAL_INCLUDE}"
"${_LOCAL_LIB}"
"${_LOCAL_SHARE}"
"${TMP}"
"${PYENV_ROOT}"
"${GOENV_ROOT}")

for I in "${DIRS[@]}"; do
  mkdir -p "${I}"
done

export CURL GIT UNAME SHA512SUM INSTALL UNZIP TAR MACH ARCH OS SDIR
${SDIR}/install_programs.sh
