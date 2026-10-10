terraform {
  required_version = ">= 1.7.0"
}

module "compute-functionapp" {
  source = "../.."

  resource_group_name = "rg-example"
  location            = "eastus"
  tags = {
    environment = "dev"
  }

  service_plans = {} # see README Inputs table / upstream module docs for the per-entry schema
  function_apps = {} # see README Inputs table / upstream module docs for the per-entry schema
}
