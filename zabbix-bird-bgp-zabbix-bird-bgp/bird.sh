#!/bin/sh

# Produce JSON list of BGP sessions..

sudo birdc show proto | awk '
BEGIN { sep = "" }
$2 == "BGP" {
  if (sep == "") { printf "%s", "{\"data\":[" }
  printf "%s{\"{#PEERNAME}\":\"%s\"}", sep, $1;
  if (sep == "") { sep = ", " }
}
END { if (sep != "") { print "]}" } }
