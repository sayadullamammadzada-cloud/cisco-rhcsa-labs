# RHCSA (EX200) Laboratoriyaları — RHEL 9

## Laboratoriya mühiti
| VM | Hostname | IP | Rol |
|---|---|---|---|
| servera | servera.lab.example.com | 172.25.250.10/24 | Əsas tapşırıqlar |
| serverb | serverb.lab.example.com | 172.25.250.11/24 | NFS/autofs, repo server |

Rocky Linux 9 və ya AlmaLinux 9 da tam uyğundur.

## Tapşırıqlar
| # | Mövzu |
|---|---|
| [01](tasks/01-users-groups.md) | İstifadəçilər, qruplar, sudo |
| [02](tasks/02-permissions-acl.md) | İcazələr, SGID, sticky bit, ACL |
| [03](tasks/03-storage-lvm.md) | Bölmələr, LVM, swap, fstab |
| [04](tasks/04-networking.md) | nmcli, hostname, /etc/hosts |
| [05](tasks/05-systemd-boot.md) | systemd, target, root şifrə bərpası |
| [06](tasks/06-selinux.md) | SELinux kontekstləri, boolean, port |
| [07](tasks/07-firewalld.md) | firewalld |
| [08](tasks/08-scheduling.md) | cron, at, systemd timer |
| [09](tasks/09-autofs-nfs.md) | NFS və autofs |
| [10](tasks/10-containers-podman.md) | Podman, rootless konteyner, systemd servis |
| [11](tasks/11-software-repos.md) | dnf, repo konfiqurasiyası |
| [12](tasks/12-tuning-logs-time.md) | tuned, journald, chrony |

Bütün tapşırıqlar üçün: [`practice-exam.md`](practice-exam.md) və avtomatik yoxlayıcı [`scripts/check-exam.sh`](scripts/check-exam.sh).
