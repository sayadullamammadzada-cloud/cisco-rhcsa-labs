# Lab 06 — DHCP Server və Relay

## Ssenari
- R1 iki VLAN üçün DHCP server rolunu oynayır.
- R2 başqa seqmentdə yerləşir və `ip helper-address` ilə DHCP relay edir.

| Pool | Şəbəkə | Gateway | İstisna |
|---|---|---|---|
| VLAN10 | 192.168.10.0/24 | .1 | .1 – .10 |
| VLAN20 | 192.168.20.0/24 | .1 | .1 – .10 |
| REMOTE | 192.168.30.0/24 | .1 | .1 – .10 |

## Yoxlama
```
show ip dhcp binding
show ip dhcp pool
show ip dhcp conflict
PC> ipconfig /renew
```
