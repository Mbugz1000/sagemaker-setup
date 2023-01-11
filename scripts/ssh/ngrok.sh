echo "Downloading ngrok..."
curl https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > ngrok.zip
unzip -o ngrok.zip

echo "Creating config file /home/ec2-user/SageMaker/.ngrok/config.yml..."
mkdir -p /home/ec2-user/SageMaker/.ngrok
if [[ ! -e /home/ec2-user/SageMaker/.ngrok/config.yml ]]; then
    cat > /home/ec2-user/SageMaker/.ngrok/config.yml << EOF
authtoken: $NGROK_AUTH_TOKEN
tunnels:
    ssh:
        proto: tcp
        addr: 22
EOF
    chown -R ec2-user:ec2-user /home/ec2-user/SageMaker/.ngrok
fi