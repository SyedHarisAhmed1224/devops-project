variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "project"
}

variable "location" {
  description = "Azure region to deploy the resources in"
  type        = string
  default     = "East US"
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
  default     = "azureuser"
}

variable "public_key_path" {
  description = "Path to your public SSH key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
