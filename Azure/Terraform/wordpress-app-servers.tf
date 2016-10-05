resource "azurerm_network_interface" "wordpress1nic" {
    name = "wordpress1nic"
    location = "${var.azure_region}"
    resource_group_name = "${azurerm_resource_group.wordpressDev.name}"

    ip_configuration {
        name = "wordpress1nic_config"
        subnet_id = "${azurerm_subnet.DMZ1.id}"
        private_ip_address_allocation = "dynamic"
    }
}


resource "azurerm_virtual_machine" "wordpressappserver1" {
    name = "wordpressappserver1"
    location = "${var.azure_region}"
    resource_group_name = "${azurerm_resource_group.wordpressDev.name}"
    network_interface_ids = ["${azurerm_network_interface.wordpress1nic.id}"]
    vm_size = "Standard_A0"

    storage_image_reference {
        publisher = "Canonical"
        offer = "UbuntuServer"
        sku = "14.04.2-LTS"
        version = "latest"
    }

    storage_os_disk {
        name = "myosdisk1"
        vhd_uri = "${azurerm_storage_account.wpdevvhdstorageaccount.primary_blob_endpoint}${azurerm_storage_container.wpdevvhdstoragecontainer.name}/myosdisk1.vhd"
        caching = "ReadWrite"
        create_option = "FromImage"
    }

    os_profile {
        computer_name = "wordpressappserver1"
        admin_username = "testadmin"
        admin_password = "Password1234!"
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }

    tags {
        environment = "dev"
    }
}