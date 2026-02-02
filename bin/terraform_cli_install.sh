#!/usr/bin/env bash
# 更新套件清單並安裝必要工具
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

# 下載 HashiCorp GPG 金鑰並儲存
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

# 驗證金鑰指紋（可選）
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint

# 新增 HashiCorp 軟體來源
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# 更新來源並安裝 Terraform
sudo apt update
sudo apt-get install terraform
