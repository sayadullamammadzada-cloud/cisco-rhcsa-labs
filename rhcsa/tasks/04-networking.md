# 04 — Şəbəkə Konfiqurasiyası

## Tapşırıq
`servera` üçün statik konfiqurasiya:
- IP: `172.25.250.10/24`, Gateway: `172.25.250.254`, DNS: `172.25.250.254`
- Hostname: `servera.lab.example.com`
- Əlavə IP: `10.0.0.10/24`
- `serverb.lab.example.com` → `172.25.250.11` statik həll olunsun.

## Həll
```bash
nmcli con show
nmcli con mod "Wired connection 1" \
  ipv4.method manual \
  ipv4.addresses 172.25.250.10/24 \
  ipv4.gateway 172.25.250.254 \
  ipv4.dns 172.25.250.254 \
  connection.autoconnect yes
nmcli con mod "Wired connection 1" +ipv4.addresses 10.0.0.10/24
nmcli con up "Wired connection 1"

hostnamectl set-hostname servera.lab.example.com
echo '172.25.250.11 serverb.lab.example.com serverb' >> /etc/hosts
```

## Yoxlama
```bash
ip -br a; ip route; cat /etc/resolv.conf; hostname; ping -c2 serverb
```
