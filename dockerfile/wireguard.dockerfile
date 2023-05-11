arg SYSTEM
arg RELEASE
from ${SYSTEM}:${RELEASE}
ENV DEBIAN_FRONTEND noninteractive
run apt update && \
apt install -y linux-headers-$(uname -r) iproute2 iptables xtables-addons-common xtables-addons-dkms wireguard ssh rustc cargo git && \
apt clean autoclean && \
apt autoremove -y && \
mkdir /root/.ssh && \
git clone https://github.com/MindFlavor/prometheus_wireguard_exporter.git && \
cargo install --path ./prometheus_wireguard_exporter && \
rm -rf /prometheus_wireguard_exporter
env PATH="$PATH:/root/.cargo/bin/"
