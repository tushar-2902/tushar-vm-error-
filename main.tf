module "rg" {
  source = "../azurerm_resource"

 rg-name = "tushar-rg"
 location = "west us 3"
}

module "pip" {
  depends_on = [module.rg]
  source     = "../azurerm_public_pip"
  
  pip-name = "tushar-pip"
  rg-name = "tushar-rg"
  location = "west us 3"
}

module "kv" {
  depends_on = [module.rg]
  source     = "../azurerm_key_valut"

  kv-name = "tushar-kv"
  location = "west us 3"
  rg-name = "tushar-rg"
  
}



module "vn" {
  depends_on = [module.rg]
  source     = "../azurerm_virtual_network"

  vn-name = "tushar-vn"
  location = "west us 3"
  rg-name = "tushar-rg"
}

module "sb" {
  depends_on = [module.vn]
  source     = "../azurerm_subnet"

 sb-name = "tushar-sb"
 rg-name = "tushar-rg"
 vn-name="tushar-vn"
 ap-value = ["10.0.1.0/24"]
}

module "vm" {
  depends_on = [module.sb]
  source     = "../azurerm_virtual_machine"

 pip-name = "tushar-pip"
 rg-name = "tushar-rg"
 sb-name = "tushar-sb"
 vn-name = "tushar-vn"
 kv-name = "tushar-kv"
 ks-name = "tushar-ks"
 nic-name = "tushar-nic"
 location = "west us 3"
 vm-name = "tushar-vm"
 

}