output "service_plans" {
  description = "Map (same keys as var.service_plans) of every output from each App Service plans backing the function apps created -- see upstream module docs for the full shape."
  value       = module.service_plan
}

output "function_apps" {
  description = "Map (same keys as var.function_apps) of every output from each function apps (set kind/os_type for Linux/Windows Functions) created -- see upstream module docs for the full shape."
  value       = module.function_app
}
