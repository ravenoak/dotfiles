#!/bin/bash
set -ueo pipefail

# shellcheck source=../functions/installers.sh
source "${FDIR}/installers.sh"

# Install `goenv`
URL="https://github.com/syndbg/goenv.git"
install_git ${URL} "${GOENV_ROOT}"
