#!/bin/bash
# RHCSA sınaq imtahanı yoxlayıcısı (servera). İstifadə: sudo bash check-exam.sh
PASS=0; FAIL=0
ok()   { echo -e "  \e[32m✔\e[0m $1"; PASS=$((PASS+1)); }
bad()  { echo -e "  \e[31m✘\e[0m $1"; FAIL=$((FAIL+1)); }
check(){ local desc=$1; shift; if "$@" &>/dev/null; then ok "$desc"; else bad "$desc"; fi; }

echo "== Şəbəkə =="
check "Hostname servera.lab.example.com" test "$(hostname)" = servera.lab.example.com
check "IP 172.25.250.10 təyin edilib"   bash -c "ip -4 a | grep -q '172.25.250.10/24'"

echo "== Repozitoriyalar =="
check "BaseOS repo aktivdir"    bash -c "dnf repolist enabled 2>/dev/null | grep -qi baseos"
check "AppStream repo aktivdir" bash -c "dnf repolist enabled 2>/dev/null | grep -qi appstream"

echo "== SELinux / httpd =="
check "SELinux enforcing"                test "$(getenforce)" = Enforcing
check "httpd aktiv və enabled"           bash -c "systemctl is-active httpd && systemctl is-enabled httpd"
check "Port 82 http_port_t"              bash -c "semanage port -l | grep http_port_t | grep -qw 82"
check "Firewall 82/tcp açıqdır"          bash -c "firewall-cmd --list-ports | grep -qw 82/tcp"

echo "== İstifadəçilər =="
check "sysadmins qrupu"                  getent group sysadmins
check "natasha ∈ sysadmins"              bash -c "id -nG natasha | grep -qw sysadmins"
check "harry ∈ sysadmins"                bash -c "id -nG harry | grep -qw sysadmins"
check "sarah nologin"                    bash -c "getent passwd sarah | grep -q nologin$"
check "sarah ∉ sysadmins"                bash -c "! id -nG sarah | grep -qw sysadmins"
check "alex UID 3456"                    test "$(id -u alex 2>/dev/null)" = 3456

echo "== Cron =="
check "natasha cron 14:23"               bash -c "crontab -l -u natasha | grep -Eq '^23 14 \* \* \*.*logger'"

echo "== Qovluqlar =="
check "/common/admin qrup sysadmins"     test "$(stat -c %G /common/admin 2>/dev/null)" = sysadmins
check "/common/admin SGID"               test -g /common/admin

echo "== NTP / autofs =="
check "chrony classroom.example.com"     grep -q '^server classroom.example.com' /etc/chrony.conf
check "autofs aktivdir"                  systemctl is-active autofs
check "auto.master /rhome"               bash -c "grep -rqs '^/rhome' /etc/auto.master /etc/auto.master.d/"

echo "== Fayllar =="
check "/root/found mövcuddur"            test -d /root/found
check "/root/lines mövcuddur"            test -s /root/lines
check "/root/backup.tar.gz arxivi"       bash -c "file /root/backup.tar.gz | grep -q gzip"
check "/usr/local/bin/mysearch icra oluna bilər" test -x /usr/local/bin/mysearch

echo "== Konteyner =="
check "natasha linger aktiv"             test -f /var/lib/systemd/linger/natasha
check "webapp systemd user servisi"      bash -c "ls /home/natasha/.config/systemd/user/ 2>/dev/null | grep -q webapp || ls /home/natasha/.config/containers/systemd/ 2>/dev/null | grep -q webapp"

echo
echo "Nəticə: $PASS keçdi, $FAIL uğursuz"
[[ $FAIL -eq 0 ]]
