FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y 
curl 
wget 
git 
sudo 
openssh-server 
python3 
python3-pip 
nano 
vim 
ca-certificates 
&& rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash coder && 
echo "coder:mahfuz@20738" | chpasswd && 
usermod -aG sudo coder

RUN mkdir -p /var/run/sshd

RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN mkdir -p /home/coder/.config/code-server && 
printf "bind-addr: 0.0.0.0:8080\nauth: password\npassword: mahfuz@20738\ncert: false\n" 
> /home/coder/.config/code-server/config.yaml

RUN chown -R coder:coder /home/coder

COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]
