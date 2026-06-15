#!/bin/bash

mkdir -p /var/run/sshd

/usr/sbin/sshd \
  -o ListenAddress=127.0.0.1 \
  -o Port=22

su - coder -c "code-server --bind-addr 0.0.0.0:${PORT:-8080}"
