# Create 2 Az Users, 1 for you and 1 for trainer
resource "azuread_user" "user1" {
  user_principal_name = var.user1-hs.email
  display_name        = var.user1-hs.name
  mail_nickname       = var.user1-hs.mail_nick_name
  password            = var.user1-hs.pwd
  depends_on          = [azurerm_resource_group.rg-1]
}

resource "azuread_user" "trainer" {
  user_principal_name   = var.ibrahimozbek.email
  display_name          = var.ibrahimozbek.name
  mail_nickname         = var.ibrahimozbek.mail_nick_name
  password              = var.ibrahimozbek.pwd
  force_password_change = true
  depends_on            = [azurerm_resource_group.rg-1]
}


# Users AWS
resource "aws_iam_user" "users-aws" {
  for_each   = toset(var.colleagues)
  name       = each.value
  depends_on = [aws_s3_bucket.hs]
}

# AWS Bucket
resource "aws_s3_bucket" "hs" {
  bucket     = "${var.bucket-name}-${count.index}"
  count      = var.bucket-number
  depends_on = [azuread_user.user1]
}

# Create AZ Resource Group, VM and Storage Account
# RG
resource "azurerm_resource_group" "rg-1" {
  name     = var.azure_rg_name
  location = var.azure_rg_location
}


# VM
resource "azurerm_virtual_machine" "hsvm" {
  name                  = var.azure_vm_name
  location              = azurerm_resource_group.rg-1.location
  resource_group_name   = azurerm_resource_group.rg-1.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = var.azure_vm_size

  storage_os_disk {
    name              = var.azure_vm_disk_name
    caching           = var.azure_vm_disk_caching
    create_option     = var.azure_vm_disk_create_option
    managed_disk_type = var.azure_vm_disk_managed_type
  }
  depends_on = [azurerm_storage_account.stg-1]
}

# Azure Subnet
# Implicit Dependency, it will be created after RG and VN
resource "azurerm_subnet" "internal" {
  name                 = var.azure_subnet_name
  resource_group_name  = azurerm_resource_group.rg-1.name
  virtual_network_name = azurerm_virtual_network.vn-1.name
  address_prefixes     = [var.azure_subnet_address_prefix]
}

# Azure VN
# Implicit Dependency, it will be created after RG
resource "azurerm_virtual_network" "vn-1" {
  name                = var.azure_vn_name
  address_space       = [var.azure_vn_address_space]
  location            = azurerm_resource_group.rg-1.location
  resource_group_name = azurerm_resource_group.rg-1.name
}

# Azure Network interface
# Implicit dependency, it is going to be created after Resource group and Subnet
resource "azurerm_network_interface" "main" {
  name                = var.azure_network_int_name
  location            = azurerm_resource_group.rg-1.location
  resource_group_name = azurerm_resource_group.rg-1.name

  ip_configuration {
    name                          = var.azure_network_int_ip_conf_name
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = var.azure_network_int_ip_conf_ip_address_allocation
  }
}

# Azure Storage account
# Implicit dependency, it is going to be created after Resource Group
resource "azurerm_storage_account" "stg-1" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg-1.name
  location                 = azurerm_resource_group.rg-1.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_repl_type

  tags = {
    Environment = var.storage_account_tag_env
    Source      = var.storage_account_tag_source
  }
  depends_on = [aws_iam_user.users-aws]
}
