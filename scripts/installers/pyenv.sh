#!/bin/bash
set -ueo pipefail

# shellcheck source=../functions/installers.sh
source "${FDIR}/installers.sh"

# Install `pyenv`
URL="https://github.com/pyenv/pyenv.git"
install_git ${URL} "${PYENV_ROOT}"
