#!/bin/bash -e

[ ! -d /var/spool/squid/00 ] && squid -z -f /etc/squid/squid.conf
squid -k parse -f /etc/squid/squid.conf
squid -f /etc/squid/squid.conf -N &
pid=$!
trap "kill $pid" TERM;
wait $pid
