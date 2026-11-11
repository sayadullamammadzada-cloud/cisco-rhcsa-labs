# 01 — İstifadəçilər və Qruplar

## Tapşırıq
1. `sysadmins` qrupunu GID 3000 ilə yaradın.
2. `natasha` və `harry` istifadəçilərini yaradın, əlavə qrup olaraq `sysadmins` olsun.
3. `sarah` istifadəçisi interaktiv shell-ə malik olmasın və `sysadmins`-ə daxil olmasın.
4. Hamısının şifrəsi `redhat` olsun.
5. `sysadmins` qrupu şifrəsiz sudo hüququna malik olsun.
6. `harry`-nin şifrəsi hər 30 gündən bir dəyişdirilməlidir.
7. Yeni istifadəçilərin şifrəsi standart olaraq 90 gün etibarlı olsun.

## Həll
```bash
groupadd -g 3000 sysadmins
useradd -G sysadmins natasha
useradd -G sysadmins harry
useradd -s /sbin/nologin sarah
for u in natasha harry sarah; do echo redhat | passwd --stdin "$u"; done

echo '%sysadmins ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/sysadmins
chmod 440 /etc/sudoers.d/sysadmins
visudo -cf /etc/sudoers.d/sysadmins

chage -M 30 harry
sed -i 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS   90/' /etc/login.defs
```

## Yoxlama
```bash
id natasha; getent passwd sarah; chage -l harry
sudo -l -U natasha
```
