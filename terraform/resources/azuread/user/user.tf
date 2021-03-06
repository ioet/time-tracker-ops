resource "azuread_user" "new_user" {
  given_name          = var.given_name
  surname             = var.surname
  user_principal_name = var.user_principal_name
  display_name        = format("%s %s", var.given_name, var.surname)
  mail_nickname       = var.mail_nickname
  password            = var.password
#   tags = {
#     description = var.description
#     createdBy   = var.createdBy
#   }
}
