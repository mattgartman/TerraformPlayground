provider "azurerm" {
  subscription_id = "c6456f52-ae4c-4ab7-82db-8e1c633403bc"
  client_id       = "cf5d3ca9-e273-4ca1-99e1-878bb3840eb6"
  client_secret   = "${var.azure_client_secret}"
  tenant_id       = "d3a424fc-8b0a-425b-a5b0-f8a565df5001"
}

