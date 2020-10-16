#!/bin/bash
set -ueo pipefail

# Install `pyenv`
URL="https://github.com/pyenv/pyenv.git"
install_git ${URL} "${PYENV_ROOT}"
