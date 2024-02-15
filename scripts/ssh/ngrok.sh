echo "Downloading ngrok..."
curl https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz > /home/ec2-user/SageMaker/ngrok.tgz
tar -xvzf /home/ec2-user/SageMaker/ngrok.tgz -C /home/ec2-user/SageMaker

echo "Creating config file /home/ec2-user/SageMaker/.ngrok/config.yml..."
mkdir -p /root/.config/ngrok && tee /root/.config/ngrok/ngrok.yml << EOF
authtoken: $NGROK_AUTH_TOKEN
tunnels:
    ssh:
        proto: tcp
        addr: 22
EOF
chown -R ec2-user:ec2-user /home/ec2-user/SageMaker/.ngrok
