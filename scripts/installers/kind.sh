#!/bin/bash
set -ueo pipefail

# shellcheck source=../functions/installers.sh
source "${FDIR}/installers.sh"

# Install `kind`
VER='v0.9.0'
BIN="kind-${OS}-${ARCH}"
URL="https://github.com/kubernetes-sigs/kind/releases/download/${VER}/${BIN}"
install_download "${URL}" "${BIN}" "${_LOCAL_BIN}" "kind"
