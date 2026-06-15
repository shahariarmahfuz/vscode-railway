#!/bin/bash

mkdir -p /var/run/sshd

Local SSH only

/usr/sbin/sshd 
-o ListenAddress=127.0.0.1 
-o Port=22

Install NekoTunnel

curl -fsSL -H "bypass-tunnel-reminder: true" 
"https://ap.tunnel.theorbit.tech/install.sh" | bash

এখানে নিজের টোকেন বসাবে

nekotunnel token ntk_kGQxhORJnqkXq-1jUSVA_j0cO4Di6nsfsYGR_g

TCP 22 expose

nekotunnel tcp 22

Tunnel বন্ধ হলে আবার চালু হবে

(
while true
do
nekotunnel start tcp 22
echo "Tunnel stopped. Restarting in 5 seconds..."
sleep 5
done
) &

Run code-server

exec su - coder -c "code-server --bind-addr 0.0.0.0:${PORT:-8080}"
