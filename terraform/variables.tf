variable "resource_group_name" {
  default = "project"
}

variable "location" {
  default = "East US"
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "admin_username" {
  default = "azureuser"
}

variable "windows_username" {
  description = "Windows username for path resolution"
  default     = "pc"
}
