#!/bin/sh
#Scan bird conf files and get configured bgp session and show difference between birdc output
CONFIG=$(grep -r "^protocol bgp" /etc 2>/dev/null | wc -l)
BIRDC=$(sudo birdc show proto | grep -cw BGP)

test "$CONFIG" = "$BIRDC" && echo '0' || echo '1'

