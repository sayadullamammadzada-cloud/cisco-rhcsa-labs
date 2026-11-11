# 12 — Tuning, Jurnallar, Vaxt

## tuned
```bash
dnf -y install tuned && systemctl enable --now tuned
tuned-adm recommend
tuned-adm profile virtual-guest
tuned-adm active
```

## Proses prioriteti
```bash
nice -n 10 sha1sum /dev/zero &
renice -n 5 -p <PID>
ps -eo pid,ni,comm --sort=-ni | head
```

## chrony — NTP
Tapşırıq: sistem `classroom.example.com` ilə sinxronlaşsın, saat qurşağı `Asia/Baku` olsun.
```bash
timedatectl set-timezone Asia/Baku
sed -i 's/^pool .*/server classroom.example.com iburst/' /etc/chrony.conf
systemctl restart chronyd
chronyc sources -v
timedatectl
```

## Jurnallar
```bash
journalctl -u sshd --since today
journalctl -p err -b
logger -p local7.notice "Test mesajı"
tail /var/log/messages
```

## Faylların axtarışı (klassik tapşırıq)
```bash
mkdir -p /root/found
find / -user harry -type f -exec cp -a {} /root/found/ \; 2>/dev/null
grep 'ich' /usr/share/dict/words > /root/wordlist 2>/dev/null || true
tar cjf /root/local.tar.bz2 /usr/local
```
