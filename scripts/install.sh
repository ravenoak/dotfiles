#!/bin/bash
set -ueo pipefail

BASE="$( cd "$(dirname "$0")"/.. >/dev/null 2>&1 ; pwd -P )"
SDIR="${BASE}/scripts"
FDIR="${BASE}/scripts/functions"
export BASE SDIR FDIR

# shellcheck source=../configs/default.sh
source "${BASE}/configs/default.sh"
# shellcheck source=../scripts/functions/setup.sh
source "${FDIR}/setup.sh"

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

"${SDIR}"/install_programs.sh
