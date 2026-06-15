#!/bin/bash

mkdir -p /var/run/sshd

/usr/sbin/sshd \
  -o ListenAddress=127.0.0.1 \
  -o Port=22

curl -fsSL -H "bypass-tunnel-reminder: true" \
"https://ap.tunnel.theorbit.tech/install.sh" | bash

nekotunnel token ntk_kGQxhORJnqkXq-1jUSVA_j0cO4Di6nsfsYGR_g

nekotunnel tcp 22

(
while true
do
    nekotunnel start tcp 22
    sleep 5
done
) &

exec su - coder -c "code-server --bind-addr 0.0.0.0:${PORT:-8080}"
