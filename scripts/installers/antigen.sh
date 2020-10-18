#!/bin/bash
set -ueo pipefail

# shellcheck source=../functions/installers.sh
source "${FDIR}/installers.sh"

# Install `antigen`
install_download git.io/antigen antigen-all-all "${_LOCAL_LIB}" antigen.zsh

