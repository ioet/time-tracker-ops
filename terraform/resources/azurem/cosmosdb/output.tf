output "endpoint" {
  value = azurerm_cosmosdb_account.cosmosdb_account.endpoint
}

output "id" {
  value = azurerm_cosmosdb_account.cosmosdb_account.id
}

output "read_endpoints" {
  value = azurerm_cosmosdb_account.cosmosdb_account.read_endpoints
}

output "write_endpoints" {
  value = azurerm_cosmosdb_account.cosmosdb_account.write_endpoints
}


output "connection_strings" {
  value = azurerm_cosmosdb_account.cosmosdb_account.connection_strings
}
