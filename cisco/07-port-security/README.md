# Lab 07 — Port Security

## Tələblər
1. Fa0/1–10 portlarında maksimum 2 MAC ünvanı olsun.
2. MAC ünvanları `sticky` ilə öyrənilsin.
3. Pozuntu baş verdikdə port `restrict` rejiminə keçsin (Fa0/1–10), server portu Fa0/24 isə `shutdown`.
4. İstifadə olunmayan portlar söndürülüb "BLACKHOLE" VLAN 999-a salınsın.
5. err-disabled portlar 300 saniyədən sonra avtomatik bərpa olunsun.

## Yoxlama
```
show port-security
show port-security interface fa0/1
show port-security address
show interfaces status err-disabled
```
