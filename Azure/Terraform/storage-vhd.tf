resource "azurerm_storage_account" "wpdevvhdstorageaccount" {
    name = "wpdevvhdstorageaccount"
    resource_group_name = "${azurerm_resource_group.wordpressDev.name}"
    location = "${var.azure_region}"
    account_type = "Standard_LRS"

    tags {
        environment = "dev"
    }
}



resource "azurerm_storage_container" "wpdevvhdstoragecontainer" {
    name = "wpdevvhdstoragecontainer"
    resource_group_name = "${azurerm_resource_group.wordpressDev.name}"
    storage_account_name = "${azurerm_storage_account.wpdevvhdstorageaccount.name}"
    container_access_type = "private"
}