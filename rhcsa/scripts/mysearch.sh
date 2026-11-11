#!/bin/bash
# /usr altında 30K-50K arası ölçüdə və SGID biti olan faylları /root/myfiles-a kopyalayır.
# Quraşdırma: install -m 755 mysearch.sh /usr/local/bin/mysearch
set -euo pipefail
DEST=/root/myfiles
mkdir -p "$DEST"
find /usr -type f -size +30k -size -50k -perm -2000 -exec cp -a {} "$DEST"/ \; 2>/dev/null
echo "Kopyalandı: $(ls -1 "$DEST" | wc -l) fayl → $DEST"
