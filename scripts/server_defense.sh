#!/bin/bash
# Automated Server Hardening
# Installs UFW, Fail2Ban, and ClamAV

echo "[+] Installing Security Stack..."
sudo apt-get update && sudo apt-get install -y ufw fail2ban clamav

echo "[+] Configuring Firewall (Default Deny)..."
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw --force enable

echo "[+] Configuring Fail2Ban..."
# Create a local jail for SSH protection
sudo bash -c 'cat > /etc/fail2ban/jail.local <<EOF
[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 3
EOF'
sudo systemctl restart fail2ban

echo "[+] Defense Pipeline Active."
