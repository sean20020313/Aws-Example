#!/bin/bash

# 切換到工作目錄
cd /workspace

# 下載 AWS CLI v2 安裝檔
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# 解壓縮
unzip awscliv2.zip

# 安裝 AWS CLI
sudo ./aws/install

# 回到 Codespaces 的工作根目錄
cd $THEIA_WORKSPACE_ROOT
