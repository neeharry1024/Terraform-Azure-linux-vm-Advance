output "vm_public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "ssh_command" {
  value = "ssh azureuser@${azurerm_public_ip.public_ip.ip_address}"
}

output "web_url" {
  value = "http://${azurerm_public_ip.public_ip.ip_address}"
}
