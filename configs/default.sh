_LOCAL=${HOME}/.local
_LOCAL_BIN=${_LOCAL}/bin
_LOCAL_INCLUDE=${_LOCAL}/include
_LOCAL_LIB=${_LOCAL}/lib
_LOCAL_SHARE=${_LOCAL}/share

TMP=/tmp/dotfiles-download

PYENV_ROOT=${_LOCAL_SHARE}/pyenv
GOENV_ROOT=${_LOCAL_SHARE}/goenv

export _LOCAL _LOCAL_BIN _LOCAL_INCLUDE _LOCAL_LIB _LOCAL_SHARE TMP PYENV_ROOT GOENV_ROOT
