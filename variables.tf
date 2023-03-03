# Variables for the user and trainer - AZURE USERS
variable "user1-hs" {
  default = {
    email          = "huang.shewei@email.com"
    name           = "Huang Shewei"
    mail_nick_name = "huang.shewei"
    pwd            = "qwerty"
  }
}

variable "ibrahimozbek" {
  default = {
    email          = "ibrahim.ozbekler@email.com"
    name           = "Ibrahim Ozbekler"
    mail_nick_name = "ibrahim.ozbekler"
    pwd            = "qwerty"
  }
}

# Variable for users AWS
variable "colleagues" {
  default = ["MireilleDib", "RyanDeMos", "HeeSungShin", "JieyaoDeng"]
}

# Variable for buckets AWS
variable "bucket-name" {
  default = "hs-bucket-terraform-devops"
}
variable "bucket-number" {
  default = 2
}

# Variable for storage account AZ
variable "storage_account_name" {
  default = "hs-storage-account"
}
variable "storage_account_tier" {
  default = "Standard"
}
variable "storage_account_repl_type" {
  default = "GRS"
}
variable "storage_account_tag_env" {
  default = "Staging"
}
variable "storage_account_tag_source" {
  default = "Development"
}


# Variables for Azure Network interface
variable "azure_network_int_name" {
  default = "hs-network-interface"
}
variable "azure_network_int_ip_conf_name" {
  default = "ipconfig-1"
}
variable "azure_network_int_ip_conf_ip_address_allocation" {
  default = "Dynamic"
}

# Variables for Azure Virtual Network
variable "azure_vn_name" {
  default = "network-hs"
}
variable "azure_vn_address_space" {
  default = "10.0.0.0/16"
}


# Variable for Azure Subnet
variable "azure_subnet_name" {
  default = "internal"
}
variable "azure_subnet_address_prefix" {
  default = "10.0.2.0/24"
}

# Variable for Azure VM
variable "azure_vm_name" {
  default = "hs-vm-fdm-1"
}
variable "azure_vm_size" {
  default = "Standard_DS1_v2"
}
variable "azure_vm_disk_name" {
  default = "myosdisk1"
}
variable "azure_vm_disk_caching" {
  default = "ReadWrite"
}
variable "azure_vm_disk_create_option" {
  default = "FromImage"
}
variable "azure_vm_disk_managed_type" {
  default = "Standard_LRS"
}

# Variables for Azure RG
variable "azure_rg_name" {
  default = "hs-rg-fdm-devops-terraform"
}
variable "azure_rg_location" {
  default = "Canada Central"
}
