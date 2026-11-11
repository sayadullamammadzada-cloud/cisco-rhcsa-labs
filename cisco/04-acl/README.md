# Lab 04 — Access Control Lists

## Ssenari
- `192.168.10.0/24` — İşçilər (Employees)
- `192.168.20.0/24` — Qonaqlar (Guests)
- `172.16.1.10` — Daxili Web/FTP server
- R1 Gi0/2 — İnternet tərəf

## Tələblər
1. **Standart ACL (10):** Yalnız İşçilər şəbəkəsi R1-ə SSH/VTY ilə qoşula bilsin.
2. **Genişləndirilmiş ACL (GUEST_IN):** Qonaqlar:
   - Daxili serverə **heç bir** giriş etməsin,
   - İnternetdə yalnız HTTP/HTTPS və DNS istifadə etsin.
3. İşçilər serverə HTTP, HTTPS və FTP ilə daxil ola bilsin.

## Qayda
- Standart ACL → təyinata **yaxın**
- Genişləndirilmiş ACL → mənbəyə **yaxın**

## Yoxlama
```
show access-lists
show ip interface gi0/1 | include access list
```
