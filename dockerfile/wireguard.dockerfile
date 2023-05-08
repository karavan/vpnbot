arg SYSTEM
arg RELEASE
from ${SYSTEM}:${RELEASE}
ENV DEBIAN_FRONTEND noninteractive
run apt update && \
apt install -y wireguard iproute2 net-tools lsof iptables linux-headers-$(uname -r) ssh rustc cargo git && \
apt clean autoclean && \
apt autoremove -y && \
mkdir /root/.ssh && \
git clone https://github.com/MindFlavor/prometheus_wireguard_exporter.git && \
cargo install --path ./prometheus_wireguard_exporter && \
rm -rf /prometheus_wireguard_exporter
env PATH="$PATH:/root/.cargo/bin/"
