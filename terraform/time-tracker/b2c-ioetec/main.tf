module "test_user" {
  source              = "../../resources/user"
  given_name          = "Test"
  surname             = "User"
  user_principal_name = "test_user@ioetec.onmicrosoft.com"
  mail_nickname       = "test_user"
}


module "test_group" {
  source              = "../../resources/group"
  name    = "TestUsers"
  # members = [
  #   module.test_user.object_id,
  # ]
}
