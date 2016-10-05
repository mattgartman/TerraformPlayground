# Create a virtual network in the web_servers resource group
resource "azurerm_virtual_network" "wordpressdevnetwork" {
  name                = "wordpressdevnetwork"
  address_space       = ["10.0.0.0/16"]
  location            = "${var.azure_region}"
  resource_group_name = "${azurerm_resource_group.wordpressDev.name}"
}


resource "azurerm_subnet" "DMZ1" {
    name = "DMZ1"
    resource_group_name = "${azurerm_resource_group.wordpressDev.name}"
    virtual_network_name = "${azurerm_virtual_network.wordpressdevnetwork.name}"
    address_prefix = "10.0.1.0/24"
}

resource "azurerm_subnet" "DMZ2" {
    name = "DMZ2"
    resource_group_name = "${azurerm_resource_group.wordpressDev.name}"
    virtual_network_name = "${azurerm_virtual_network.wordpressdevnetwork.name}"
    address_prefix = "10.0.2.0/24"
}