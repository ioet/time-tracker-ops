module "eys-training-api" {
  source   = "../../resources/azurem/resource-group"
  name     = "eys-training-api"
  location = "South Central US"
}

module "storageaccounteystr82c5"{
  source = "../../resources/azurem/storage-account"
  name = "storageaccounteystr82c5"
  resource_group_name = module.eys-training-api.name
  location = "centralus"
  account_kind = "Storage"
}

module "storageaccounteystr82c5-blob-container"{
  source = "../../resources/azurem/storage-account-container"
  name = "function-releases"
  storage_account_name = module.storageaccounteystr82c5.name
  container_access_type= "private"
}

module "ASP-eystrainingapi-83a4" {
  source = "../../resources/azurem/app-service-plan"
  name = "ASP-eystrainingapi-83a4"
  location = "centralus"
  resource_group_name = module.eys-training-api.name
  kind = "functionapp"
  reserved = true
  tier = "Dynamic"
  size = "Y1"
}

module "time-tracker-events" {
  source = "../../resources/azurem/application_insights"
  name = "time-tracker-events"
  location = "centralus"
  resource_group_name = module.eys-training-api.name
  application_type = "web"
  sampling_percentage = "0"

}

module "time-tracker-db"{
  source = "../../resources/azurem/cosmosdb"
  name = "time-tracker-db"
  location =  module.eys-training-api.location
  resource_group_name = module.eys-training-api.name
  offer_type = "Standard"
  kind = "GlobalDocumentDB"
  enable_automatic_failover = false
  enable_free_tier = true
  enable_capabilities = "EnableAggregationPipeline"
  doc_capabilities = "mongoEnableDocLevelTTL"
  version_capabilities = "MongoDBv3.4"
  consistency_level = "Session"
  max_interval_in_seconds = 5
  max_staleness_prefix = 100
  failover_location = module.eys-training-api.location

}


module "function-app-time-tracker-events" {
  source = "../../resources/azurem/function-app"
  name                                = "time-tracker-events"
  location                            = "centralus"
  resource_group_name                 = module.eys-training-api.name
  app_service_plan_id                 = module.ASP-eystrainingapi-83a4.id
  storage_account_name                = module.storageaccounteystr82c5.name
  storage_account_access_key          = module.storageaccounteystr82c5.primary_access_key
  os_type                             = "linux"
  enable_builtin_logging              = false
  app_insights_instrumentation_key    = module.time-tracker-events.instrumentation_key
  app_insights_conection_string       = format("InstrumentationKey=%s",module.time-tracker-events.instrumentation_key)
  cosmodb_uri                         = module.time-tracker-db.connection_strings[0] # "AccountEndpoint=https://time-tracker-db.documents.azure.com:443/;AccountKey=6lyRD8ma0VQjcMbeSMFOTDGwNDptcEGfngp3c9DStNAMCNh2MRbkNWmRinoNvuB6aH51EMEkgeP5WfW3VZiV9g==;"
  worker_runtime                      = "python"
  storage_account_blob                = "https://storageaccounteystr82c5.blob.core.windows.net/function-releases/20200430192020-7b868bbb-0aa9-406f-872b-d1dc73e815d4.zip?sv=2018-03-28&sr=b&sig=9GUYY7wa4%2B1nXlpAK%2BE5w%2Fv3ILlXpB6tOjUkiTvcNcI%3D&st=2020-04-30T19%3A15%3A24Z&se=2030-04-30T19%3A20%3A24Z&sp=r"

}
