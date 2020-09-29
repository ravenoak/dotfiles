export _LOCAL=${HOME}/.local
export _LOCAL_BIN=${_LOCAL}/bin
export _LOCAL_LIB=${_LOCAL}/lib
export _LOCAL_SHARE=${_LOCAL}/share

export GOPATH=${_LOCAL_SHARE}/gopath
export PYENV_ROOT=${_LOCAL_SHARE}/pyenv
export GOENV_ROOT=${_LOCAL_SHARE}/goenv

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

export PATH="${PYENV_ROOT}/bin:${GOENV_ROOT}/bin:${PATH}"

# Use antigen https://github.com/zsh-users/antigen
if [[ -e ${_LOCAL_LIB}/antigen.zsh ]]; then
  source ${_LOCAL_LIB}/antigen.zsh
fi

#antigen use oh-my-zsh
#antigen bundle zsh-users/zsh-syntax-highlighting
#antigen apply

if [[ -x $(which ksshaskpass) ]]; then export SSH_ASKPASS=$(which ksshaskpass); fi
${_LOCAL_BIN}/start_keychain.sh
if [[ -x $(which pyenv) ]]; then eval "$(pyenv init -)"; fi
export GOENV_GOPATH_PREFIX=${_LOCAL_SHARE}/gopath
if [[ -x $(which goenv) ]]; then eval "$(goenv init -)"; export PATH="$GOROOT/bin:$PATH:$GOPATH/bin"; fi

alias ls="ls --color "

# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
