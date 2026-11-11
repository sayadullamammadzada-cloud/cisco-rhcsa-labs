# Lab 05 — NAT və PAT

## Topologiya
```
 LAN 192.168.1.0/24 --- Gi0/0 [ R1 ] Gi0/1 --- 203.0.113.0/29 --- [ ISP ]
 Web server 192.168.1.100
```
| Ünvan | Təyinat |
|---|---|
| 203.0.113.1 | ISP |
| 203.0.113.2 | R1 xarici interfeysi (PAT üçün) |
| 203.0.113.5 | Web serverin statik NAT ünvanı |

## Məqsəd
1. Web server (192.168.1.100) xaricdən 203.0.113.5 ilə əlçatan olsun (static NAT).
2. Qalan LAN istifadəçiləri xarici interfeys ünvanı ilə internetə çıxsın (PAT/overload).

## Yoxlama
```
show ip nat translations
show ip nat statistics
debug ip nat
clear ip nat translation *
```
