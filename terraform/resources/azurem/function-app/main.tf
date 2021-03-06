resource "azurerm_function_app" "function-app" {
  name                       = var.name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = var.app_service_plan_id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  os_type                    = var.os_type
  enable_builtin_logging     = var.enable_builtin_logging
  version                    = "~3"
  app_settings                   = {
      "APPINSIGHTS_INSTRUMENTATIONKEY"        = var.app_insights_instrumentation_key
      "APPLICATIONINSIGHTS_CONNECTION_STRING" = var.app_insights_conection_string
      "COSMOS_DATABASE_URI"                   = var.cosmodb_uri
      "FUNCTIONS_WORKER_RUNTIME"              = var.worker_runtime
      "WEBSITE_RUN_FROM_PACKAGE"              = var.storage_account_blob
}
}