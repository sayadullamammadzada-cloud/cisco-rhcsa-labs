# 05 — systemd və Boot Prosesi

## Tapşırıq A — Servislər
1. `httpd` quraşdırın, işə salın və açılışda avtomatik başlasın.
2. `cups` servisini söndürün və mask edin.
3. Sistem standart olaraq `multi-user.target`-ə açılsın.

```bash
dnf -y install httpd
systemctl enable --now httpd
systemctl disable --now cups 2>/dev/null; systemctl mask cups
systemctl set-default multi-user.target
```

## Tapşırıq B — root şifrəsini bərpa etmək
1. Yenidən başladın, GRUB menyusunda `e` basın.
2. `linux` sətrinin sonuna `rd.break` əlavə edin, `Ctrl+X`.
3. Aşağıdakıları icra edin:
```bash
mount -o remount,rw /sysroot
chroot /sysroot
passwd root
touch /.autorelabel
exit
exit
```

## Tapşırıq C — Journal-ı daimi etmək
```bash
mkdir -p /var/log/journal
sed -i 's/^#\?Storage=.*/Storage=persistent/' /etc/systemd/journald.conf
systemctl restart systemd-journald
journalctl --list-boots
```
