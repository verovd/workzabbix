#!/bin/bash
CHECK=`ip route show $1 | wc -l`
test "$CHECK" -ne 1 ;echo $?
exit 0

