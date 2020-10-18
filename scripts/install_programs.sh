#!/bin/bash
set -ueo pipefail

for installer in "${SDIR}"/installers/*.sh; do
  ${installer}
done
