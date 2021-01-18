# Time Tracker Ops

## 1. Requirements
### Install Azure CLI
```
curl -L https://aka.ms/InstallAzureCli | bash
```
### Install Terraform
Follow this [link](https://www.terraform.io/downloads.html)

## 2. Setup Azure Login
Check the credentials in slack channel
```
# login with the credentials
az login
# set subcription
az account set --subscription ca70c44c-ad7a-4333-a22c-07ebc6a6922
# create account to manage IaaC
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/ca70c44c-ad7a-4333-a22c-07ebc6a69224"  
```
