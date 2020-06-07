#!/usr/bin/env sh

# Install Fail2Ban from master branch

set -e

SCRIPT_DIR="$(cd "$(dirname "${SCRIPT}")" >/dev/null 2>&1 && pwd)"
. "${SCRIPT_DIR}/detect_python.sh"

download_dir="/usr/src"
if [ $# -gt 1 ]; then
  download_dir="$1"
fi

opkg update
opkg install git
opkg install git-http

mkdir -p "${download_dir}"
cd "${download_dir}"
git clone https://github.com/fail2ban/fail2ban.git
cd fail2ban

if [ "${python_ver}" -eq 3 ]; then
  opkg install python3-lib2to3
  /usr/bin/env "${python_prog}" "${SCRIPT_DIR}/2to3" -w --no-diffs bin/* fail2ban
fi

/usr/bin/env "${python_prog}" setup.py install 