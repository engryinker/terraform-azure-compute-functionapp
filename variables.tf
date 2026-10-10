variable "resource_group_name" {
  description = "Name of the existing resource group to deploy every resource in this module call into. This module does not create the resource group itself."
  type        = string
}

variable "location" {
  description = "Azure region for every resource created by this module call."
  type        = string
}

variable "tags" {
  description = "Default tags applied to every resource created by this module call (e.g. the output of terraform-azure-tags). Overridden per-resource by that resource's own `tags` attribute, if set."
  type        = map(string)
  default     = {}
}

variable "enable_telemetry" {
  description = "Default AVM telemetry opt-in/out applied to every resource created by this module call. See https://aka.ms/avm/telemetry. Overridden per-resource by that resource's own `enable_telemetry` attribute, if set."
  type        = bool
  default     = true
}

variable "service_plans" {
  description = "Map of App Service plans backing the function apps to create, keyed by an arbitrary caller-chosen map key. Mirrors the inputs of Azure/avm-res-web-serverfarm/azurerm v2.0.8 (https://registry.terraform.io/modules/Azure/avm-res-web-serverfarm/azurerm/2.0.8) 1:1 -- see upstream docs for the schema of any field typed `any`. `name`, `tags` and `enable_telemetry` (where present upstream) are handled specially by this wrapper; every other field is passed straight through unmodified."
  type = map(object({
    name                            = string
    tags                            = optional(map(string))
    enable_telemetry                = optional(bool)
    retry                           = optional(any, null)
    storage_mounts                  = optional(any, null)
    timeouts                        = optional(any, null)
    diagnostic_settings             = optional(any, null)
    per_site_scaling_enabled        = optional(bool, null)
    plan_default_identity           = optional(any, null)
    rdp_enabled                     = optional(bool, null)
    role_assignments                = optional(any, null)
    server_farm_resource_type       = optional(string, null)
    virtual_network_subnet_id       = optional(string, null)
    maximum_elastic_worker_count    = optional(number, null)
    sku_name                        = optional(string, null)
    worker_count                    = optional(number, null)
    os_type                         = string
    app_service_environment_id      = optional(string, null)
    async_scaling_enabled           = optional(bool, null)
    managed_identities              = optional(any, null)
    premium_plan_auto_scale_enabled = optional(bool, null)
    zone_balancing_enabled          = optional(bool, null)
    install_scripts                 = optional(any, null)
    lock                            = optional(any, null)
    registry_adapters               = optional(any, null)
  }))
  default = {}
}

variable "function_apps" {
  description = "Map of function apps (set kind/os_type for Linux/Windows Functions) to create, keyed by an arbitrary caller-chosen map key. Mirrors the inputs of Azure/avm-res-web-site/azurerm v0.23.0 (https://registry.terraform.io/modules/Azure/avm-res-web-site/azurerm/0.23.0) 1:1 -- see upstream docs for the schema of any field typed `any`. `name`, `tags` and `enable_telemetry` (where present upstream) are handled specially by this wrapper; every other field is passed straight through unmodified."
  type = map(object({
    name                                           = string
    tags                                           = optional(map(string))
    enable_telemetry                               = optional(bool)
    service_plan_resource_id                       = string
    application_insights_key                       = optional(string, null)
    dns_configuration                              = optional(any, null)
    ignore_body_changes                            = optional(any, null)
    managed_identities                             = optional(any, null)
    ssh_enabled                                    = optional(bool, null)
    always_ready                                   = optional(any, null)
    auth_settings                                  = optional(any, null)
    client_affinity_partitioning_enabled           = optional(bool, null)
    connection_strings                             = optional(any, null)
    storage_shares_to_mount                        = optional(any, null)
    storage_user_assigned_identity_client_id       = optional(string, null)
    virtual_network_subnet_id                      = optional(string, null)
    slot_sensitive_app_settings                    = optional(any, null)
    vnet_application_traffic_enabled               = optional(bool, null)
    deployment_slots_inherit_lock                  = optional(bool, null)
    function_app_uses_fc1                          = optional(bool, null)
    https_only                                     = optional(bool, null)
    managed_environment_id                         = optional(string, null)
    public_network_access_enabled                  = optional(bool, null)
    redundancy_mode                                = optional(string, null)
    scm_site_also_stopped                          = optional(bool, null)
    use_extension_bundle                           = optional(bool, null)
    container_size                                 = optional(number, null)
    all_child_resources_inherit_tags               = optional(bool, null)
    app_service_active_slot                        = optional(any, null)
    application_insights_connection_string         = optional(string, null)
    auth_settings_v2                               = optional(any, null)
    bundle_version                                 = optional(string, null)
    storage_account_access_key                     = optional(string, null)
    vnet_content_share_enabled                     = optional(bool, null)
    backup                                         = optional(any, null)
    functions_extension_version                    = optional(string, null)
    resource_types                                 = optional(any, null)
    certificates                                   = optional(any, null)
    client_certificate_enabled                     = optional(bool, null)
    client_certificate_mode                        = optional(string, null)
    end_to_end_encryption_enabled                  = optional(bool, null)
    sticky_settings                                = optional(any, null)
    storage_container_endpoint                     = optional(string, null)
    timeouts                                       = optional(any, null)
    vnet_image_pull_enabled                        = optional(bool, null)
    enabled                                        = optional(bool, null)
    retry                                          = optional(any, null)
    storage_authentication_type                    = optional(string, null)
    storage_uses_managed_identity                  = optional(bool, null)
    virtual_network_backup_restore_enabled         = optional(bool, null)
    zip_deploy_file                                = optional(string, null)
    logic_app_runtime_version                      = optional(string, null)
    delete_empty_service_plan                      = optional(bool, null)
    host_names_disabled                            = optional(bool, null)
    lock                                           = optional(any, null)
    logic_app_node_version                         = optional(string, null)
    app_settings                                   = optional(map(string), null)
    auto_generated_domain_name_label_scope         = optional(string, null)
    client_affinity_enabled                        = optional(bool, null)
    instance_memory_in_mb                          = optional(number, null)
    key_vault_reference_identity                   = optional(string, null)
    vnet_route_all_traffic                         = optional(bool, null)
    logs                                           = optional(any, null)
    scm_publish_basic_authentication_enabled       = optional(bool, null)
    site_config                                    = optional(any, null)
    storage_account_required                       = optional(bool, null)
    content_share_force_disabled                   = optional(bool, null)
    custom_domains                                 = optional(any, null)
    dapr_config                                    = optional(any, null)
    fc1_runtime_name                               = optional(string, null)
    fc1_runtime_version                            = optional(string, null)
    ip_mode                                        = optional(string, null)
    os_type                                        = optional(string, null)
    resource_config                                = optional(any, null)
    builtin_logging_enabled                        = optional(bool, null)
    deployment_slots                               = optional(any, null)
    hosting_environment_id                         = optional(string, null)
    hyper_v                                        = optional(bool, null)
    kind                                           = optional(string, null)
    storage_account_share_name                     = optional(string, null)
    client_affinity_proxy_enabled                  = optional(bool, null)
    maximum_instance_count                         = optional(number, null)
    private_endpoints                              = optional(any, null)
    storage_container_type                         = optional(string, null)
    client_certificate_exclusion_paths             = optional(string, null)
    diagnostic_settings                            = optional(any, null)
    private_endpoints_inherit_lock                 = optional(bool, null)
    private_endpoints_manage_dns_zone_group        = optional(bool, null)
    role_assignments                               = optional(any, null)
    storage_account_name                           = optional(string, null)
    storage_user_assigned_identity_id              = optional(string, null)
    zip_deploy_wait_duration                       = optional(string, null)
    daily_memory_time_quota                        = optional(number, null)
    ftp_publish_basic_authentication_enabled       = optional(bool, null)
    slots_storage_shares_to_mount_sensitive_values = optional(map(string), null)
    workload_profile_name                          = optional(string, null)
  }))
  default = {}
}
