# 🛠️ DevOps Lab: Ubuntu Server VM Setup & Troubleshooting Guide

## ✅ Overview

This guide documents the setup steps and fixes required to get an Ubuntu Server VirtualBox VM DevOps-ready, including:

- Resolving DNS & networking issues
- Installing Guest Additions
- Using Shared Folders to transfer files
- Installing Docker, Minikube, Kubernetes CLI, and other DevOps tools
- Verifying installations

---

## 🧱 VirtualBox VM Configuration

| Setting       | Value                          |
|---------------|--------------------------------|
| OS            | Ubuntu 24.04.1 LTS (Server)    |
| RAM           | 6–8 GB                         |
| CPUs          | 2                              |
| Disk          | 30–40 GB VDI (dynamically allocated) |
| Shared Folder | C:\Users\wquar\SharedFolder    |

✅ Enable:
- Shared Clipboard: Bidirectional  
- Shared Folder: Auto-mount & Permanent

---

## 🔧 DNS / Networking Issue: `Could not resolve host`

### ❌ Problem

Minikube download failed:
---
curl: (6) Could not resolve host: storage.googleapis.com

### ✅ Fix

```bash
sudo netplan apply
---
Test:
ping google.com -c 2
---
💽 Guest Additions / Drag & Drop Issue
❌ Error
Drag and drop operation from host to guest failed
VBox_E_DND_ERROR

❗ Cause
Drag-and-drop does not work in Ubuntu Server (CLI-only). Use Shared Folders instead.
---
📁 Shared Folders Setup
✅ Host Setup
Create a folder on Windows:
C:\Users\wquar\SharedFolder

Put files in it (e.g., minikube_latest_amd64.deb)

✅ VirtualBox Settings
Settings → Shared Folders

Add folder:

Folder Path: C:\Users\wquar\SharedFolder

Folder Name: SharedFolder

✅ Auto-mount, ✅ Make Permanent

✅ Ubuntu Access
cd /media/sf_SharedFolder/
---
If permission denied:
sudo usermod -aG vboxsf $USER
sudo reboot
---
🔧 Guest Additions Manual Install (for Shared Folder support)
# Insert ISO via Devices → Insert Guest Additions CD Image…

sudo apt update
sudo apt install -y build-essential dkms linux-headers-$(uname -r)

sudo mkdir -p /mnt/cdrom
sudo mount /dev/cdrom /mnt/cdrom
sudo /mnt/cdrom/VBoxLinuxAdditions.run
sudo reboot
---
Verify:
lsmod | grep vboxguest
---
🐳 DevOps Tools Installation
# Update
sudo apt update && sudo apt upgrade -y

# Docker
sudo apt install -y docker.io
sudo usermod -aG docker $USER

# Docker Compose
sudo apt install -y docker-compose

# Git
sudo apt install -y git

# Python3 & Pip
sudo apt install -y python3 python3-pip

# Terraform
sudo apt install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update && sudo apt install -y terraform

# Ansible
sudo apt install -y ansible

# Kubernetes CLI
sudo apt install -y kubectl

# Or Kubernetes CLI (kubectl)
sudo snap install kubectl --classic


# Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

# Or Minikube (via Shared Folder)
cp /media/sf_SharedFolder/minikube_latest_amd64.deb ~/
sudo dpkg -i minikube_latest_amd64.deb
---
✅ Tool Verification Commands
docker --version
docker-compose --version
git --version
python3 --version && pip3 --version
terraform version
ansible --version | head -n 1
kubectl version --client --output=yaml
minikube version
---
