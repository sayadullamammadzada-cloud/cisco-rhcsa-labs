# RHCSA Sınaq İmtahanı (RHEL 9)

⏱ Vaxt: **2 saat 30 dəqiqə** · Keçid balı: **210/300**

> Bütün dəyişikliklər yenidən başlatmadan sonra qalmalıdır. İmtahanın sonunda sistemi reboot edib yoxlayın.

## servera

| # | Tapşırıq | Bal |
|---|---|---|
| 1 | Şəbəkə: IP `172.25.250.10/24`, GW/DNS `172.25.250.254`, hostname `servera.lab.example.com` | 15 |
| 2 | `BaseOS` və `AppStream` repozitoriyalarını `serverb`-dən konfiqurasiya edin | 15 |
| 3 | SELinux: `httpd` 82 portunda `/var/www/html`-dən məzmun versin, firewall-da açıq olsun | 25 |
| 4 | `sysadmins` qrupu, `natasha`, `harry` (sysadmins üzvü), `sarah` (nologin) — şifrə `redhat` | 20 |
| 5 | `natasha` hər gün 14:23-də `logger "EX200 in progress"` icra etsin | 10 |
| 6 | `/common/admin` — qrup `sysadmins`, rwx yalnız qrup üçün, SGID aktiv | 15 |
| 7 | `classroom.example.com` ilə NTP sinxronizasiyası | 10 |
| 8 | autofs: `remoteuser1` ev qovluğu `serverb:/rhome/remoteuser1` | 25 |
| 9 | `alex` istifadəçisi UID `3456` ilə, şifrə `redhat` | 10 |
| 10 | `harry`-yə aid bütün faylları `/root/found`-a kopyalayın | 15 |
| 11 | `/usr/share/xml/iso-codes/iso_639_3.xml`-dən `ich` olan sətirləri `/root/lines` faylına yazın | 10 |
| 12 | Rootless konteyner `webapp`, port 8080, `natasha` üçün systemd servis | 30 |
| 13 | `/usr/local` qovluğunu `/root/backup.tar.gz` olaraq arxivləyin | 10 |
| 14 | `/usr/local/bin/mysearch` skripti: `/usr` altında 30K–50K ölçülü, SGID-li faylları `/root/myfiles`-a kopyalayır | 15 |

## serverb

| # | Tapşırıq | Bal |
|---|---|---|
| 15 | root şifrəsini bərpa edin, yeni şifrə `flectrag` | 15 |
| 16 | Repozitoriyaları konfiqurasiya edin | 5 |
| 17 | `myvol` LV həcmini 230–260 MiB arasına genişləndirin (fayl sistemi daxil) | 15 |
| 18 | 512 MiB əlavə swap bölməsi (daimi) | 15 |
| 19 | `wgroup` VG (PE 16 MiB), `wshare` LV (60 extent), `vfat`, `/mnt/wshare`-ə daimi mount | 20 |
| 20 | Tövsiyə olunan `tuned` profilini aktiv edin | 5 |

---
Həllər: [`tasks/`](tasks) qovluğu. Avtomatik yoxlama: `sudo bash scripts/check-exam.sh`
