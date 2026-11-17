#!/bin/sh

for MNT in /media/*; do
  if [ -d "$MNT" ]; then
    mount -o remount,rw "$MNT" 2>/dev/null
    grep -h "lights:" /var/opt/public/oap/*/data/ambient_config.log 2>/dev/null | tail -20 > "$MNT/lights_log.txt"
    sync
  fi
done
