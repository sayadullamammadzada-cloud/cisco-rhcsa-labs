# 06 — SELinux

## Tapşırıq
1. SELinux `enforcing` rejimində olsun (daimi).
2. Apache `/srv/web` qovluğundan məzmun versin.
3. Apache 82-ci portda da dinləsin.
4. Apache-nin NFS-dən məzmun verməsinə icazə verin.

## Həll
```bash
setenforce 1
sed -i 's/^SELINUX=.*/SELINUX=enforcing/' /etc/selinux/config

mkdir -p /srv/web && echo "Salam RHCSA" > /srv/web/index.html
semanage fcontext -a -t httpd_sys_content_t '/srv/web(/.*)?'
restorecon -Rv /srv/web
sed -i 's#DocumentRoot "/var/www/html"#DocumentRoot "/srv/web"#' /etc/httpd/conf/httpd.conf
cat >> /etc/httpd/conf/httpd.conf <<'CONF'
<Directory "/srv/web">
    Require all granted
</Directory>
Listen 82
CONF

semanage port -a -t http_port_t -p tcp 82
setsebool -P httpd_use_nfs on
systemctl restart httpd
```

## Problemlərin aşkarlanması
```bash
ls -Zd /srv/web
ausearch -m AVC -ts recent
sealert -a /var/log/audit/audit.log    # setroubleshoot-server lazımdır
semanage port -l | grep http_port_t
getsebool -a | grep httpd
```
