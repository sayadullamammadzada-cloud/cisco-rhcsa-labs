# 03 — Saxlama: Bölmələr, LVM, Swap

> Əlavə disk: `/dev/vdb` (5 GiB)

## Tapşırıq
1. `/dev/vdb`-də 2 GiB-lıq bölmə yaradın, `myvg` volume group (PE ölçüsü 16 MiB) qurun.
2. `mylv` adlı 50 extent-lik logical volume yaradın, `xfs` ilə formatlayın, `/mnt/data`-ya daimi mount edin.
3. 512 MiB swap bölməsi yaradıb daimi aktiv edin.
4. Mövcud `mylv` həcmini fayl sistemi ilə birlikdə 1 GiB-a qədər artırın.
5. VDO/Stratis tələb olunmur (RHEL 9 EX200).

## Həll
```bash
parted /dev/vdb mklabel gpt
parted /dev/vdb mkpart primary 1MiB 2049MiB
parted /dev/vdb set 1 lvm on
parted /dev/vdb mkpart primary linux-swap 2049MiB 2561MiB
udevadm settle

pvcreate /dev/vdb1
vgcreate -s 16M myvg /dev/vdb1
lvcreate -l 50 -n mylv myvg
mkfs.xfs /dev/myvg/mylv
mkdir -p /mnt/data
echo '/dev/myvg/mylv /mnt/data xfs defaults 0 0' >> /etc/fstab

mkswap /dev/vdb2
UUID=$(blkid -s UUID -o value /dev/vdb2)
echo "UUID=$UUID swap swap defaults 0 0" >> /etc/fstab

systemctl daemon-reload
mount -a && swapon -a

# Genişləndirmə (xfs yalnız böyüyə bilər)
lvextend -r -L 1G /dev/myvg/mylv
```

## Yoxlama
```bash
lsblk; vgdisplay myvg | grep 'PE Size'; lvs; swapon --show; df -h /mnt/data
```
> ⚠️ `fstab` səhvi sistemin açılmamasına səbəb olur — həmişə `mount -a` ilə yoxlayın.
