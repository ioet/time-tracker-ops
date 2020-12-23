provider "azuread" {
  version = "=1.1.0"
  tenant_id = "cc925a5d-9644-4a4f-8d99-0bee49aadd05"
}

# module "test_user" {
#   source              = "../../resources/user"
#   given_name          = "Test"
#   surname             = "User"
#   user_principal_name = "test_user@ioetec.com"
#   mail_nickname       = "test_user"
# }


# module "test_group" {
#   source              = "../../resources/group"
#   name    = "TestUsers"
#   members = [
#     module.test_user.object_id,
#   ]
# }
