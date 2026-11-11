# 11 — Proqram Təminatı və Repozitoriyalar

## Tapşırıq
1. Aşağıdakı repozitoriyaları konfiqurasiya edin:
   - BaseOS: `http://serverb.lab.example.com/rhel9/BaseOS`
   - AppStream: `http://serverb.lab.example.com/rhel9/AppStream`
2. `httpd`, `vim-enhanced`, `tmux` paketlərini quraşdırın.
3. `nodejs` modulunun mövcud axınlarını göstərin.

## Həll
```bash
cat > /etc/yum.repos.d/local.repo <<'REPO'
[BaseOS]
name=BaseOS
baseurl=http://serverb.lab.example.com/rhel9/BaseOS
enabled=1
gpgcheck=0

[AppStream]
name=AppStream
baseurl=http://serverb.lab.example.com/rhel9/AppStream
enabled=1
gpgcheck=0
REPO
dnf clean all && dnf repolist
dnf -y install httpd vim-enhanced tmux
dnf module list nodejs
```

## Faydalı əmrlər
```bash
dnf provides */semanage      # hansı paket bu faylı verir
dnf history
rpm -qf /usr/sbin/semanage
rpm -qc httpd                # konfiqurasiya faylları
```
