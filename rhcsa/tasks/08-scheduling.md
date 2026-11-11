# 08 — Planlaşdırılmış Tapşırıqlar

## Tapşırıq
1. `natasha` hər gün 14:23-də `logger "EX200 in progress"` icra etsin.
2. Hər iş günü (B.e.–Cümə) saat 02:00-da `/etc` qovluğu `/backup`-a arxivlənsin (root).
3. 5 dəqiqə sonra bir dəfəlik `date >> /tmp/at.log` icra olunsun.
4. Hər 10 dəqiqədən bir systemd timer ilə disk istifadəsi jurnala yazılsın.

## Həll
```bash
crontab -u natasha -e
# 23 14 * * * /usr/bin/logger "EX200 in progress"

mkdir -p /backup
echo '0 2 * * 1-5 root tar czf /backup/etc-$(date +\%F).tar.gz /etc' > /etc/cron.d/etc-backup

echo 'date >> /tmp/at.log' | at now + 5 minutes
atq

cat > /etc/systemd/system/diskusage.service <<'UNIT'
[Unit]
Description=Disk istifadəsini jurnala yaz
[Service]
Type=oneshot
ExecStart=/usr/bin/sh -c 'df -h / | logger -t diskusage'
UNIT
cat > /etc/systemd/system/diskusage.timer <<'UNIT'
[Unit]
Description=Hər 10 dəqiqədən bir
[Timer]
OnCalendar=*:0/10
Persistent=true
[Install]
WantedBy=timers.target
UNIT
systemctl daemon-reload
systemctl enable --now diskusage.timer
```

## Yoxlama
```bash
crontab -l -u natasha; systemctl list-timers; journalctl -t diskusage
```
