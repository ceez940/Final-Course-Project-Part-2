#!/bin/bash

set -e

echo "Creating AWS server..."
ansible-playbook aws.yml

echo "Waiting for server to be ready..."
sleep 60

echo "Installing Minecraft..."
ansible-playbook -i hosts.ini minecraft.yml

IP=$(awk '/^[0-9]/ {print $1}' hosts.ini)

echo "Checking Minecraft service..."
ansible -i hosts.ini minecraft -a "sudo systemctl status minecraft --no-pager"

echo "Waiting for Minecraft to fully start..."
sleep 45

echo "Testing Minecraft port..."
nmap -sV -Pn -p T:25565 "$IP"
