# createion of Resource Group
module "resource_groups" {
 source  = "myprivate_tf_repo/azurerm/resource_group"
  version = "1.0.0"
  location             = var.location
  resource_group_name     = var.resource_group_name
}

#creation of vnet, subnet with delegation , PE subnet , Private DNS
module "network" {
   source  = "myprivate_tf_repo/azurerm/network_full"
   version = "1.0.0"
  resource_group_name   = module.resource_groups.resource_group_name
  location              = module.resource_groups.resource_group_location
  data = local.network_data_full
}

#creation of Application Gateway and WAF policy
module "WAF" {
   source  = "myprivate_tf_repo/azurerm/waf"
   version = "1.0.0"
  resource_group_name   = module.resource_groups.resource_group_name
  location              = module.resource_groups.resource_group_location
  data = local.waf_data
}

#creation of Front end web app and Function app
module "Webapp-fe" {
   source  = "myprivate_tf_repo/azurerm/waf"
   version = "1.0.0"
  resource_group_name   = module.resource_groups.resource_group_name
  location              = module.resource_groups.resource_group_location
  data = local.fe_data
}

#creation of Back end web app and Function app
module "Webapp-be" {
   source  = "myprivate_tf_repo/azurerm/waf"
   version = "1.0.0"
  resource_group_name   = module.resource_groups.resource_group_name
  location              = module.resource_groups.resource_group_location
  data = local.be_data
}

#creation of Storage account 
module "Storage" {
   source  = "myprivate_tf_repo/azurerm/storage"
   version = "1.0.0"
  resource_group_name   = module.resource_groups.resource_group_name
  location              = module.resource_groups.resource_group_location
  data = local.sto_data
}

#creation of SQL
module "sql" {
   source  = "myprivate_tf_repo/azurerm/sql"
   version = "1.0.0"
  resource_group_name   = module.resource_groups.resource_group_name
  location              = module.resource_groups.resource_group_location
  data = local.sql_data
}

#creation of Keyvault
module "kv" {
   source  = "myprivate_tf_repo/azurerm/kv"
   version = "1.0.0"
  resource_group_name   = module.resource_groups.resource_group_name
  location              = module.resource_groups.resource_group_location
  data = local.kv_data
}


#Enabling Azure Monitor
module "Monitor" {
   source  = "myprivate_tf_repo/azurerm/Monitor"
   version = "1.0.0"
  resource_group_name   = module.resource_groups.resource_group_name
  location              = module.resource_groups.resource_group_location
  data = local.Monitor_data
}