#!/bin/sh

source $(dirname $0)/../configs/default.sh

CURL=$(which curl)
if ! [ -x ${CURL} ]; then echo "curl not installed"; exit 1; fi

GIT=$(which git)
if ! [ -x ${GIT} ]; then echo "git not installed"; exit 1; fi

# Install `antigen`
${CURL} -L git.io/antigen > ${_LOCAL_LIB}/antigen.zsh

# Install `goenv`
GOENV_DIR=${_LOCAL_SHARE}/goenv
if ! [ -d ${GOENV_DIR} ]; then
  git clone https://github.com/syndbg/goenv.git ${GOENV_DIR}
else
  echo "${GOENV_DIR} already exists, skipping..."
fi

# Install `pyenv`
PYENV_DIR=${_LOCAL_SHARE}/pyenv
if ! [ -d ${PYENV_DIR} ]; then
  git clone https://github.com/pyenv/pyenv.git ${PYENV_DIR}
else
  echo "${PYENV_DIR} already exists, skipping..."
fi

