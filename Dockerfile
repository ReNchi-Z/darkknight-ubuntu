# Resep: Ubuntu 24.04 + SSH server (password login)
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server tzdata ca-certificates curl bash \
 && mkdir -p /run/sshd /root/.ssh \
 && chmod 700 /root/.ssh \
 && sed -i 's/#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
 && sed -i 's/#\?PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config \
 && rm -rf /var/lib/apt/lists/*

# Banner darkknight
COPY banner.sh /etc/profile.d/00-banner.sh
RUN chmod +x /etc/profile.d/00-banner.sh

# Password diset saat runtime dari variabel ROOT_PASSWORD
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 22
CMD ["/start.sh"]
