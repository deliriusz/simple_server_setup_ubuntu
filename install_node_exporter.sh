#!/usr/bin/env bash
set -x

PORT="$1"

if [ -z "$PORT" ]; then
    echo "Usage: $0 <port>"
    exit 1
fi

cd /tmp
wget https://github.com/prometheus/node_exporter/releases/download/v1.9.1/node_exporter-1.9.1.linux-amd64.tar.gz
tar xfz node_exporter-1.9.1.linux-amd64.tar.gz
mv node_exporter-1.9.1.linux-amd64 /opt/node_exporter
rm node_exporter-1.9.1.linux-amd64.tar.gz
chmod 755 /opt/node_exporter/node_exporter

cat <<EOF > /etc/systemd/system/node_exporter.service
[Unit]
Description=Prometheus Server node exporter
Documentation=https://prometheus.io/docs/introduction/overview/
After=network-online.target

[Service]
User=root
Restart=on-failure

ExecStart=/opt/node_exporter/node_exporter --web.listen-address=:${PORT}

[Install]
WantedBy=multi-user.target
EOF

systemctl enable node_exporter
systemctl start node_exporter
systemctl status node_exporter
