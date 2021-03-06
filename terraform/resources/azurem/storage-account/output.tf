output "name" {
  value = azurerm_storage_account.storage-account.name
}

output "primary_access_key" {
  value = azurerm_storage_account.storage-account.primary_access_key
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.storage-account.primary_blob_endpoint
}

output "primary_queue_endpoint" {
  value = azurerm_storage_account.storage-account.primary_queue_endpoint
}

output "primary_web_endpoint" {
  value = azurerm_storage_account.storage-account.primary_web_endpoint
}

output "primary_connection_string" {
  value = azurerm_storage_account.storage-account.primary_connection_string 
}

output "primary_blob_connection_string" {
  value = azurerm_storage_account.storage-account.primary_blob_connection_string
}