# Lab 08 — Spanning Tree (Rapid PVST+)

## Topologiya
```
        [ SW1 ]
        /     \
   [ SW2 ]---[ SW3 ]
```
## Tələblər
1. Bütün switch-lərdə Rapid PVST+ aktiv edin.
2. SW1 VLAN 10 üçün primary root, VLAN 20 üçün secondary root olsun.
3. SW2 VLAN 20 üçün primary root olsun (yük balansı).
4. Access portlarda PortFast + BPDU Guard aktiv edin.
5. Root portlarına Root Guard tətbiq edin (downlink-lərdə).

## Yoxlama
```
show spanning-tree summary
show spanning-tree vlan 10
show spanning-tree root
```
