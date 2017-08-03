#!/bin/sh

# 1) Get BGP link info to zabbix.
# 2) Read and update cache file.

PEER="$1"

TTL_TIME="$(date +%s -d "120 seconds ago")"

CACHE_FILE="/var/run/zabbix/birdlink.cache"
test -s "${CACHE_FILE}" &&
  CACHE_TIME="$(date +%s -r "${CACHE_FILE}")" || CACHE_TIME=0

test "${CACHE_TIME}" -le "${TTL_TIME}" &&
  sudo birdc show proto > "${CACHE_FILE}.new" &&
  mv "${CACHE_FILE}.new" "${CACHE_FILE}" &&
  chown zabbix "${CACHE_FILE}"

awk '$1 == "'$PEER'" { print $6 }' "$CACHE_FILE"

## END ##

