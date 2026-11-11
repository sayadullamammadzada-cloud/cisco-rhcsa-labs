# 07 — firewalld

## Tapşırıq
1. `http` və `https` servislərinə daimi icazə verin.
2. TCP 82 portunu açın.
3. `172.25.250.0/24` şəbəkəsindən SSH-ə icazə, digər bütün mənbələrdən SSH-i bloklayın (rich rule).

## Həll
```bash
systemctl enable --now firewalld
firewall-cmd --permanent --add-service={http,https}
firewall-cmd --permanent --add-port=82/tcp
firewall-cmd --permanent --remove-service=ssh
firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="172.25.250.0/24" service name="ssh" accept'
firewall-cmd --reload
```

## Yoxlama
```bash
firewall-cmd --list-all
curl http://servera:82
```
