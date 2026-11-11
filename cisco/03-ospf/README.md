# Lab 03 — OSPFv2 (Area 0)

## Topologiya
```
 LAN1 192.168.1.0/24          LAN2 192.168.2.0/24         LAN3 192.168.3.0/24
      |                              |                            |
   [ R1 ]---10.0.12.0/30---[ R2 ]---10.0.23.0/30---[ R3 ]
      \_____________10.0.13.0/30_______________________/
```
| Router | Router-ID | Loopback0 |
|---|---|---|
| R1 | 1.1.1.1 | 1.1.1.1/32 |
| R2 | 2.2.2.2 | 2.2.2.2/32 |
| R3 | 3.3.3.3 | 3.3.3.3/32 |

## Məqsəd
1. Bütün şəbəkələri OSPF area 0-da elan edin.
2. LAN interfeyslərini passive edin.
3. R2-ni DR etmək üçün priority dəyişin (multi-access seqmentdə).
4. R1-də default route yaradıb OSPF-ə paylayın.

## Yoxlama
```
show ip ospf neighbor
show ip route ospf
show ip ospf interface brief
show ip protocols
```
