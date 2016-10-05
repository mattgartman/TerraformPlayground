# Create a resource group
resource "azurerm_resource_group" "wordpressDev" {
    name     = "wordpressDev"
    location = "${var.azure_region}"
}
