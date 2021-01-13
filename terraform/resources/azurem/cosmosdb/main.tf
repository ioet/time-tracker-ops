resource "azurerm_cosmosdb_account" "cosmosdb_account" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = var.offer_type
  kind                = var.kind

  enable_automatic_failover = var.enable_automatic_failover
  enable_free_tier = var.enable_free_tier

  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = var.max_interval_in_seconds
    max_staleness_prefix    = var.max_staleness_prefix
  }

  geo_location {
    location          = var.failover_location
    failover_priority = 0
  }


  tags = {
    "CosmosAccountType"       = "Production"
    "RG"                      = "eys-training-api"
    "createdBy"               = "ops-team"
    "defaultExperience"       = "Core (SQL)"
    "description"             = "CosmosDB prod environment"
    "hidden-cosmos-mmspecial" = ""
  }
}