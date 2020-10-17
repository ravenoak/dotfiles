CURL=$(command -v curl)
if ! [ -x "${CURL}" ]; then echo 'curl not installed'; exit 1; fi

GIT=$(command -v git)
if ! [ -x "${GIT}" ]; then echo 'git not installed'; exit 1; fi

UNAME=$(command -v uname)
if ! [ -x "${UNAME}" ]; then echo 'uname not installed'; exit 1; fi

SHA512SUM=$(command -v sha512sum)
if ! [ -x "${SHA512SUM}" ]; then echo 'sha512sum not installed'; exit 1; fi

INSTALL=$(command -v install)
if ! [ -x "${INSTALL}" ]; then echo 'install not installed'; exit 1; fi

UNZIP_=$(command -v unzip)
if ! [ -x "${UNZIP_}" ]; then echo 'unzip not installed'; exit 1; fi

TAR=$(command -v tar)
if ! [ -x "${TAR}" ]; then echo 'tar not installed'; exit 1; fi

MACH=$(uname -m)
if [ "${MACH}" == 'x86_64' ]; then
  ARCH='amd64'
else
  ARCH='unknown'
fi
OS=$(uname -s | tr '[:upper:]' '[:lower:]')

export CURL GIT UNAME SHA512SUM INSTALL UNZIP_ TAR MACH ARCH OS
