resource "azuread_group" "group" {
  name    = var.name
  members = var.members
}