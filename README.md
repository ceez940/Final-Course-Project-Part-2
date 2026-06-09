# Minecraft Server Automation

## Background

This project automates the deployment of a Minecraft server on AWS EC2 using Ansible. The automation creates an EC2 instance, installs Java 25, downloads the Minecraft server, creates a systemd service, and verifies that the server is running.

## Requirements

- AWS CLI
- Ansible
- AWS Academy account
- MyLinuxKey.pem or Which ever .pem you decide to use

## Files

### aws.yml
Creates the AWS security group and EC2 instance.

### minecraft.yml
Installs Java 25 and configures the Minecraft server.

### hosts.ini
Stores the EC2 public IP address and connection settings.

### vars.yml
Stores AWS and Minecraft configuration values.

### scripts/start.sh
Runs the entire deployment process.

## How to Run

Run:

```bash
./scripts/start.sh
```

The script will:

1. Create the EC2 instance.
2. Configure the Minecraft server.
3. Start the Minecraft service.
4. Verify that port 25565 is open.

## Connect to the Server

The public IP address is saved in:

```text
hosts.ini
```

Use that IP address in Minecraft Java Edition.

Port:

```text
25565
```

## Verification

Check the Minecraft service:

```bash
ansible -i hosts.ini minecraft -a "sudo systemctl status minecraft --no-pager"
```

Verify the port:

```bash
nmap -sV -Pn -p T:25565 <server-ip>
```

Expected result:

```text
25565/tcp open minecraft
```

## Sources

- [Ansible Documentation](https://docs.ansible.com/projects/ansible/latest/index.html) - ansible help 
- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/) - aws help 
- [Minecraft Server Download](https://www.minecraft.net/en-us/download/server) - latest download link
- [OpenAI](https://openai.com/) - for help with terminal commands. 
- [Mincraft Setup Wiki](https://minecraft.wiki/w/Tutorial:Setting_up_a_Java_Edition_server) - for help on which download links are needed and configuration setting. 
