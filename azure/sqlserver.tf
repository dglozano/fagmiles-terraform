resource "random_password" "sql_server_superuser_password" {
  length = 11
}

resource "azurerm_sql_server" "fagmiles_sql_server" {
  name = "fagmiles"

  resource_group_name = local.rg_name
  location            = local.rg_location

  administrator_login          = "superuser"
  administrator_login_password = random_password.sql_server_superuser_password.result
  version                      = "12.0"
}

resource "azurerm_sql_database" "fagmiles" {
  name = "Fagmiles"

  resource_group_name = local.rg_name
  location            = local.rg_location

  edition        = "Basic"
  max_size_bytes = "2147483648"
  server_name    = azurerm_sql_server.fagmiles_sql_server.name
}

resource "azurerm_sql_database" "milescamp" {
  name = "MilesCamp"

  resource_group_name = local.rg_name
  location            = local.rg_location

  edition        = "Basic"
  max_size_bytes = "2147483648"
  server_name    = azurerm_sql_server.fagmiles_sql_server.name
}
