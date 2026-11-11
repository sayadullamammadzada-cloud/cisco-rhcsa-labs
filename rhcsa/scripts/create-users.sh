#!/bin/bash
# İstifadə: sudo ./create-users.sh users.txt
# users.txt formatı: istifadeci:qrup1,qrup2:shell   (qrup və shell məcburi deyil)
#   natasha:sysadmins:
#   sarah::/sbin/nologin
set -euo pipefail
[[ $EUID -eq 0 ]] || { echo "root olaraq icra edin" >&2; exit 1; }
FILE=${1:?"İstifadə: $0 users.txt"}
DEFAULT_PASS=${DEFAULT_PASS:-redhat}

while IFS=: read -r user groups shell; do
  [[ -z "$user" || "$user" == \#* ]] && continue
  if [[ -n "$groups" ]]; then
    IFS=, read -ra glist <<< "$groups"
    for g in "${glist[@]}"; do getent group "$g" >/dev/null || groupadd "$g"; done
  fi
  if id "$user" &>/dev/null; then
    echo "[=] $user artıq mövcuddur"; continue
  fi
  args=()
  [[ -n "$groups" ]] && args+=(-G "$groups")
  [[ -n "$shell"  ]] && args+=(-s "$shell")
  useradd "${args[@]}" "$user"
  echo "$DEFAULT_PASS" | passwd --stdin "$user" >/dev/null
  echo "[+] $user yaradıldı"
done < "$FILE"
