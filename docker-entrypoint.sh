#!/bin/sh

set -e

#Make the log file & change log file permission
touch /var/log/haproxy.log
chmod 644 /var/log/haproxy.log

# Make sure service is running
service rsyslog start

# Throw the log to output
tail -f /var/log/haproxy.log &

# Start haproxy
exec haproxy -f /usr/local/etc/haproxy/haproxy.cfg  -p /var/run/haproxy.pid 


