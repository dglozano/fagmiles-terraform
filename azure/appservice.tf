resource "azurerm_app_service_plan" "fagmiles_service_plan" {
  name = "serviceplan_fagmiles"

  resource_group_name = local.rg_name
  location            = local.rg_location

  kind = "app"
  sku {
    tier = "Standard"
    size = "S2"
  }
}

resource "azurerm_app_service" "fagmiles_web" {
  name = "fagmiles-web"

  resource_group_name = local.rg_name
  location            = local.rg_location

  app_service_plan_id = azurerm_app_service_plan.fagmiles_service_plan.id
  https_only          = true

  app_settings = {
    "SOME_ENV_VARIABLE" = "HOLA"
  }

  site_config {
    always_on = true
    default_documents = [
      "Default.htm",
      "Default.html",
      "Default.asp",
      "index.htm",
      "index.html",
      "iisstart.htm",
      "default.aspx",
      "hostingstart.html",
    ]
    scm_type                  = "VSTSRM"
    use_32_bit_worker_process = true
  }
}
