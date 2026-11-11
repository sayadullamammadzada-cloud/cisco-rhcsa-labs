# Lab 01 — VLAN və Trunk

## Topologiya
```
 PC1 (VLAN10)     PC2 (VLAN20)          PC3 (VLAN10)     PC4 (VLAN20)
   |Fa0/1           |Fa0/2                |Fa0/1           |Fa0/2
 [ SW1 ]---------Gi0/1 (trunk) Gi0/1---------[ SW2 ]
```

| Cihaz | IP | VLAN |
|---|---|---|
| PC1 | 192.168.10.11/24 | 10 (SALES) |
| PC2 | 192.168.20.11/24 | 20 (IT) |
| PC3 | 192.168.10.12/24 | 10 |
| PC4 | 192.168.20.12/24 | 20 |

## Məqsəd
1. VLAN 10, 20 və native VLAN 99 yaradın.
2. Access portları təyin edin.
3. SW1–SW2 arasında 802.1Q trunk qurun, yalnız 10,20,99 icazəli olsun.
4. PC1 ↔ PC3 ping keçməli, PC1 ↔ PC2 keçməməlidir.

## Yoxlama
```
show vlan brief
show interfaces trunk
show interfaces gi0/1 switchport
```
