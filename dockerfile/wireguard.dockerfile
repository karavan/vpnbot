arg SYSTEM
arg RELEASE
from ${SYSTEM}:${RELEASE}
ENV DEBIAN_FRONTEND noninteractive
run apt update && \
apt install -y linux-headers-$(uname -r) iproute2 net-tools iptables xtables-addons-common xtables-addons-dkms wireguard ssh git && \
apt clean autoclean && \
apt autoremove -y && \
mkdir /root/.ssh
run apt install -y curl
run curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh /dev/stdin -y --no-modify-path
env PATH="$PATH:/root/.cargo/bin/"
run git clone https://github.com/MindFlavor/prometheus_wireguard_exporter.git && \
cargo install --path ./prometheus_wireguard_exporter && \
rm -rf /prometheus_wireguard_exporter
