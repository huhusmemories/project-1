# Create 2 Az Users, 1 for you and 1 for trainer
resource "azuread_user" "user1" {
  user_principal_name = var.user1-hs.email
  display_name        = var.user1-hs.name
  mail_nickname       = var.user1-hs.mail_nick_name
  password            = var.user1-hs.pwd
}

resource "azuread_user" "trainer" {
  user_principal_name   = var.ibrahimozbek.email
  display_name          = var.ibrahimozbek.name
  mail_nickname         = var.ibrahimozbek.mail_nick_name
  password              = var.ibrahimozbek.pwd
  force_password_change = true
}


# Users AWS
resource "aws_iam_user" "users-aws" {
  for_each = toset(var.colleagues)
  name     = each.value
}
