#!/bin/bash
set -ueo pipefail

# Install `goenv`
URL="https://github.com/syndbg/goenv.git"
install_git ${URL} "${GOENV_ROOT}"
