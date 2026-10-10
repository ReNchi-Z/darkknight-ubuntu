#!/bin/bash
# Set password root dari variabel Railway (fallback default)
echo "root:${ROOT_PASSWORD:-Darkknight2026!}" | chpasswd
exec /usr/sbin/sshd -D -e
