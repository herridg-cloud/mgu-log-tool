#!/bin/sh

for MNT in /media/*; do
  if [ -d "$MNT" ]; then
    mount -o remount,rw "$MNT" 2>/dev/null
    mkdir -p "$MNT/mgu_logs"
    cp /var/opt/public/oap/*/data/*.log "$MNT/mgu_logs/" 2>/dev/null
    sync
  fi
done

