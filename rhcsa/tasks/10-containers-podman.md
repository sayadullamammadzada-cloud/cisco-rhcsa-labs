# 10 — Konteynerlər (Podman)

## Tapşırıq
1. `container-tools` quraşdırın.
2. `natasha` istifadəçisi (rootless) olaraq `registry.access.redhat.com/ubi9/httpd-24` imicindən `webapp` adlı konteyner işə salın.
3. Host-da `8080` portu konteynerin `8080` portuna yönlənsin.
4. Host-dakı `~/web` qovluğu konteynerdə `/var/www/html`-ə bağlansın (SELinux ilə uyğun).
5. Konteyner `natasha`-nın systemd user servisi olsun və sistem açılışında (istifadəçi daxil olmadan) avtomatik başlasın.

## Həll
```bash
dnf -y install container-tools
loginctl enable-linger natasha
# natasha olaraq SSH ilə daxil olun (su istifadə etməyin — user systemd lazımdır)
ssh natasha@localhost
```
```bash
mkdir -p ~/web && echo "Konteynerdən salam" > ~/web/index.html
podman run -d --name webapp -p 8080:8080 \
  -v ~/web:/var/www/html:Z \
  registry.access.redhat.com/ubi9/httpd-24

mkdir -p ~/.config/systemd/user
cd ~/.config/systemd/user
podman generate systemd --name webapp --files --new
podman stop webapp && podman rm webapp
systemctl --user daemon-reload
systemctl --user enable --now container-webapp.service
```
> RHEL 9.2+ üçün alternativ: Quadlet (`~/.config/containers/systemd/webapp.container`).

Root olaraq portu açın:
```bash
firewall-cmd --permanent --add-port=8080/tcp && firewall-cmd --reload
```

## Yoxlama
```bash
podman ps; systemctl --user status container-webapp; curl localhost:8080
```
