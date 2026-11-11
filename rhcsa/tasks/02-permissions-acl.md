# 02 — İcazələr və ACL

## Tapşırıq
1. `/common/admin` qovluğunu yaradın, qrup sahibi `sysadmins` olsun.
2. Qrup üzvləri oxuyub yaza bilsin, digərlərinin heç bir hüququ olmasın.
3. Yaradılan fayllar avtomatik `sysadmins` qrupuna aid olsun (SGID).
4. İstifadəçilər yalnız öz fayllarını silə bilsin (sticky bit).
5. `/var/tmp/fstab` faylına (`/etc/fstab` kopyası): `natasha` oxuyub-yazsın, `harry` heç bir hüququ olmasın, digərləri oxuya bilsin.

## Həll
```bash
mkdir -p /common/admin
chgrp sysadmins /common/admin
chmod 3770 /common/admin       # 2=SGID, 1=sticky, 770

cp /etc/fstab /var/tmp/fstab
chown root:root /var/tmp/fstab
chmod 644 /var/tmp/fstab
setfacl -m u:natasha:rw /var/tmp/fstab
setfacl -m u:harry:--- /var/tmp/fstab
```

## umask
`natasha` üçün yeni fayllar `-r--------`, qovluqlar `dr-x------` olsun:
```bash
echo 'umask 277' >> /home/natasha/.bashrc
```

## Yoxlama
```bash
ls -ld /common/admin       # drwxrws--T
getfacl /var/tmp/fstab
```
