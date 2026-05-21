# Production-Ready Azure Linux VM with Terraform

## Overview

This project provisions a production-style Linux Virtual Machine infrastructure on Microsoft Azure using Terraform.

## Features

- Custom Virtual Network (VNet)
- Custom Subnet
- Static Public IP
- Network Security Group (NSG)
- SSH Key Authentication
- Ubuntu Linux VM
- Cloud-init Bootstrap
- Automatic Nginx Installation
- Managed Identity
- Boot Diagnostics
- Azure Monitor Agent
- Log Analytics Workspace
- Data Collection Rule (DCR)
- Remote Terraform Backend
- Terraform Variables & Outputs

---

## Architecture

Azure Resource Group
├── Virtual Network
│   └── Subnet
├── Network Security Group
├── Public IP
├── Network Interface
├── Linux Virtual Machine
│   ├── Managed Identity
│   ├── Boot Diagnostics
│   └── Azure Monitor Agent
└── Log Analytics Workspace

---

## Project Structure

```bash
terraform-azure-linux-vm/
│
├── backend.tf
├── provider.tf
├── versions.tf
├── variables.tf
├── terraform.tfvars
│
├── network.tf
├── vm.tf
├── identity.tf
├── monitor.tf
├── monitor-dcr.tf
├── diagnostics.tf
│
├── outputs.tf
├── cloud-init.yaml
├── .gitignore
└── README.md
```

---

## Prerequisites

- Terraform >= 1.5
- Azure CLI
- Azure Subscription
- SSH Key Pair

---

## Setup Instructions

### 1. Login to Azure

```bash
az login
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Validate Configuration

```bash
terraform validate
```

### 4. Plan Deployment

```bash
terraform plan
```

### 5. Apply Infrastructure

```bash
terraform apply
```

---

## Remote Backend

Terraform state is stored remotely in Azure Blob Storage.

Example backend configuration:

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "tfstateneelam2026"
    container_name       = "tfstate"
    key                  = "prod-linux-vm.tfstate"
  }
}
```

---

## Monitoring

The VM is integrated with:

- Azure Monitor Agent (AMA)
- Log Analytics Workspace
- Data Collection Rule (DCR)

Heartbeat telemetry was successfully verified.

---

## Verification

### Verify Nginx

Open:

```bash
http://PUBLIC_IP
```

### Verify Heartbeat Logs

Run query in Log Analytics:

```kusto
Heartbeat
| limit 10
```

---

## Cleanup

```bash
terraform destroy
```

---

## Skills Demonstrated

- Infrastructure as Code (IaC)
- Azure Administration
- Linux VM Provisioning
- Terraform State Management
- Cloud-init Automation
- Azure Monitoring & Observability
- Secure SSH Authentication
- Production Infrastructure Design

---

## Author

Neelam Saini
