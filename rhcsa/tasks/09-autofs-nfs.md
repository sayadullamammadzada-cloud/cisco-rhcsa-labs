# 09 — NFS və autofs

## serverb — NFS server
```bash
dnf -y install nfs-utils
mkdir -p /rhome/remoteuser1 /shares/public
useradd -u 2001 -d /rhome/remoteuser1 remoteuser1
echo redhat | passwd --stdin remoteuser1
cat >> /etc/exports <<'EOF2'
/rhome   172.25.250.0/24(rw,sync)
/shares/public 172.25.250.0/24(ro)
EOF2
systemctl enable --now nfs-server
firewall-cmd --permanent --add-service={nfs,mountd,rpc-bind}
firewall-cmd --reload
exportfs -rav
```

## servera — autofs müştəri
Tapşırıq: `remoteuser1` daxil olanda ev qovluğu `/rhome/remoteuser1` avtomatik mount olunsun. `/mnt/public` isə daimi mount olunsun.

```bash
dnf -y install autofs nfs-utils
useradd -u 2001 -d /rhome/remoteuser1 -M remoteuser1
echo redhat | passwd --stdin remoteuser1

echo '/rhome  /etc/auto.rhome' > /etc/auto.master.d/rhome.autofs
echo '*  -rw,sync  serverb:/rhome/&' > /etc/auto.rhome
systemctl enable --now autofs

mkdir -p /mnt/public
echo 'serverb:/shares/public /mnt/public nfs defaults,_netdev 0 0' >> /etc/fstab
mount -a
```

## Yoxlama
```bash
showmount -e serverb
su - remoteuser1 -c pwd
mount | grep rhome
```
