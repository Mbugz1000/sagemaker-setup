echo "Downloading ngrok..."
curl https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz > /home/ec2-user/ngrok.tgz
tar -xvzf /home/ec2-user/ngrok.tgz -C /home/ec2-user

echo "Creating config file /root/.config/ngrok/ngrok.yml..."
mkdir -p /root/.config/ngrok 
cat > /root/.config/ngrok/ngrok.yml << EOF
authtoken: $NGROK_AUTH_TOKEN
tunnels:
    ssh:
        proto: tcp
        addr: 22
EOF
chown -R ec2-user:ec2-user /root/.config/ngrok/
