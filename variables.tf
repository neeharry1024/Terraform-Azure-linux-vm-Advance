variable "resource_group_name" {
  default = "rg-prod-linux-vm"
}

variable "location" {
  default = "Central India"
}

variable "vnet_name" {
  default = "prod-vnet"
}

variable "subnet_name" {
  default = "web-subnet"
}

variable "vm_name" {
  default = "prod-linux-vm"
}

variable "admin_username" {
  default = "azureuser"
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "environment" {
  default = "Production"
}
