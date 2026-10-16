# terraform-azure-compute-functionapp

Org-standard Terraform wrapper for: **App Service plans backing the function apps, function apps (set kind/os_type for Linux/Windows Functions)**.

This repo bundles 2 related upstream AVM modules into one wrapper, since they're normally deployed together.

Deploys into an existing resource group (passed in via `resource_group_name` / `location`) -- this module does not create the resource group itself. Compose with [terraform-azure-naming](https://github.com/engryinker/terraform-azure-naming) for names and [terraform-azure-tags](https://github.com/engryinker/terraform-azure-tags) for the `tags` input.

## Usage

```hcl
module "compute-functionapp" {
  source = "git::https://github.com/engryinker/terraform-azure-compute-functionapp.git?ref=v1.0.0"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = module.tags.tags

  service_plans = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }

  function_apps = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }
}
```

See [`examples/basic`](examples/basic) for a minimal runnable (zero-instance) example.

## Inputs

Beyond the standard `resource_group_name`, `location`, `tags`, `enable_telemetry` module-level variables, each map variable below mirrors its upstream AVM module's inputs 1:1 (fields typed `any` carry complex nested upstream schemas -- see the linked module docs):

### `service_plans` (App Service plans backing the function apps)

Wraps [Azure/avm-res-web-serverfarm/azurerm](https://registry.terraform.io/modules/Azure/avm-res-web-serverfarm/azurerm/2.0.8) v2.0.8.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `retry` | `any` | no |  |
| `storage_mounts` | `any` | no |  |
| `timeouts` | `any` | no |  |
| `diagnostic_settings` | `any` | no |  |
| `per_site_scaling_enabled` | `bool` | no |  |
| `plan_default_identity` | `any` | no |  |
| `rdp_enabled` | `bool` | no |  |
| `role_assignments` | `any` | no |  |
| `server_farm_resource_type` | `string` | no |  |
| `virtual_network_subnet_id` | `string` | no |  |
| `maximum_elastic_worker_count` | `number` | no |  |
| `sku_name` | `string` | no |  |
| `worker_count` | `number` | no |  |
| `os_type` | `string` | yes |  |
| `app_service_environment_id` | `string` | no |  |
| `async_scaling_enabled` | `bool` | no |  |
| `managed_identities` | `any` | no |  |
| `premium_plan_auto_scale_enabled` | `bool` | no |  |
| `zone_balancing_enabled` | `bool` | no |  |
| `install_scripts` | `any` | no |  |
| `lock` | `any` | no |  |
| `registry_adapters` | `any` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

### `function_apps` (function apps (set kind/os_type for Linux/Windows Functions))

Wraps [Azure/avm-res-web-site/azurerm](https://registry.terraform.io/modules/Azure/avm-res-web-site/azurerm/0.23.0) v0.23.0.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `service_plan_resource_id` | `string` | yes |  |
| `application_insights_key` | `string` | no |  |
| `dns_configuration` | `any` | no |  |
| `ignore_body_changes` | `any` | no |  |
| `managed_identities` | `any` | no |  |
| `ssh_enabled` | `bool` | no |  |
| `always_ready` | `any` | no |  |
| `auth_settings` | `any` | no |  |
| `client_affinity_partitioning_enabled` | `bool` | no |  |
| `connection_strings` | `any` | no |  |
| `storage_shares_to_mount` | `any` | no |  |
| `storage_user_assigned_identity_client_id` | `string` | no |  |
| `virtual_network_subnet_id` | `string` | no |  |
| `slot_sensitive_app_settings` | `any` | no |  |
| `vnet_application_traffic_enabled` | `bool` | no |  |
| `deployment_slots_inherit_lock` | `bool` | no |  |
| `function_app_uses_fc1` | `bool` | no |  |
| `https_only` | `bool` | no |  |
| `managed_environment_id` | `string` | no |  |
| `public_network_access_enabled` | `bool` | no |  |
| `redundancy_mode` | `string` | no |  |
| `scm_site_also_stopped` | `bool` | no |  |
| `use_extension_bundle` | `bool` | no |  |
| `container_size` | `number` | no |  |
| `all_child_resources_inherit_tags` | `bool` | no |  |
| `app_service_active_slot` | `any` | no |  |
| `application_insights_connection_string` | `string` | no |  |
| `auth_settings_v2` | `any` | no |  |
| `bundle_version` | `string` | no |  |
| `storage_account_access_key` | `string` | no |  |
| `vnet_content_share_enabled` | `bool` | no |  |
| `backup` | `any` | no |  |
| `functions_extension_version` | `string` | no |  |
| `resource_types` | `any` | no |  |
| `certificates` | `any` | no |  |
| `client_certificate_enabled` | `bool` | no |  |
| `client_certificate_mode` | `string` | no |  |
| `end_to_end_encryption_enabled` | `bool` | no |  |
| `sticky_settings` | `any` | no |  |
| `storage_container_endpoint` | `string` | no |  |
| `timeouts` | `any` | no |  |
| `vnet_image_pull_enabled` | `bool` | no |  |
| `enabled` | `bool` | no |  |
| `retry` | `any` | no |  |
| `storage_authentication_type` | `string` | no |  |
| `storage_uses_managed_identity` | `bool` | no |  |
| `virtual_network_backup_restore_enabled` | `bool` | no |  |
| `zip_deploy_file` | `string` | no |  |
| `logic_app_runtime_version` | `string` | no |  |
| `delete_empty_service_plan` | `bool` | no |  |
| `host_names_disabled` | `bool` | no |  |
| `lock` | `any` | no |  |
| `logic_app_node_version` | `string` | no |  |
| `app_settings` | `map(string)` | no |  |
| `auto_generated_domain_name_label_scope` | `string` | no |  |
| `client_affinity_enabled` | `bool` | no |  |
| `instance_memory_in_mb` | `number` | no |  |
| `key_vault_reference_identity` | `string` | no |  |
| `vnet_route_all_traffic` | `bool` | no |  |
| `logs` | `any` | no |  |
| `scm_publish_basic_authentication_enabled` | `bool` | no |  |
| `site_config` | `any` | no |  |
| `storage_account_required` | `bool` | no |  |
| `content_share_force_disabled` | `bool` | no |  |
| `custom_domains` | `any` | no |  |
| `dapr_config` | `any` | no |  |
| `fc1_runtime_name` | `string` | no |  |
| `fc1_runtime_version` | `string` | no |  |
| `ip_mode` | `string` | no |  |
| `os_type` | `string` | no |  |
| `resource_config` | `any` | no |  |
| `builtin_logging_enabled` | `bool` | no |  |
| `deployment_slots` | `any` | no |  |
| `hosting_environment_id` | `string` | no |  |
| `hyper_v` | `bool` | no |  |
| `kind` | `string` | no |  |
| `storage_account_share_name` | `string` | no |  |
| `client_affinity_proxy_enabled` | `bool` | no |  |
| `maximum_instance_count` | `number` | no |  |
| `private_endpoints` | `any` | no |  |
| `storage_container_type` | `string` | no |  |
| `client_certificate_exclusion_paths` | `string` | no |  |
| `diagnostic_settings` | `any` | no |  |
| `private_endpoints_inherit_lock` | `bool` | no |  |
| `private_endpoints_manage_dns_zone_group` | `bool` | no |  |
| `role_assignments` | `any` | no |  |
| `storage_account_name` | `string` | no |  |
| `storage_user_assigned_identity_id` | `string` | no |  |
| `zip_deploy_wait_duration` | `string` | no |  |
| `daily_memory_time_quota` | `number` | no |  |
| `ftp_publish_basic_authentication_enabled` | `bool` | no |  |
| `slots_storage_shares_to_mount_sensitive_values` | `map(string)` | no |  |
| `workload_profile_name` | `string` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

## Outputs

- `service_plans` -- map (same keys as the input) of every output from each created App Service plans backing the function apps.

- `function_apps` -- map (same keys as the input) of every output from each created function apps (set kind/os_type for Linux/Windows Functions).
