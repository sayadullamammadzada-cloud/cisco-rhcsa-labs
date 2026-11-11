# Lab 02 — Inter-VLAN Routing (Router-on-a-stick)

## Topologiya
```
          [ R1 ] Gi0/0 (subinterfeyslər)
            |
          Gi0/1 (trunk)
          [ SW1 ]
         /       \
   PC1 VLAN10   PC2 VLAN20
```
| VLAN | Şəbəkə | Gateway |
|---|---|---|
| 10 | 192.168.10.0/24 | 192.168.10.1 |
| 20 | 192.168.20.0/24 | 192.168.20.1 |

## Məqsəd
PC1 (VLAN10) PC2 (VLAN20) ilə router vasitəsilə əlaqə qurmalıdır.

## Yoxlama
```
show ip interface brief
show ip route connected
ping 192.168.20.11 (PC1-dən)
```
