variable "database_migration_migrations" {
  description = <<EOT
Map of database_migration_migrations, attributes below
Required:
    - compartment_id
    - database_combination
    - type
Optional:
    - assessment_id
    - bulk_include_exclude_data
    - defined_tags
    - description
    - display_name
    - freeform_tags
    - source_container_database_connection_id
    - source_database_connection_id
    - source_standby_database_connection_id
    - target_database_connection_id
    - advanced_parameters (block):
        - data_type (optional)
        - name (optional)
        - value (optional)
    - advisor_settings (block):
        - is_ignore_errors (optional)
        - is_skip_advisor (optional)
    - data_transfer_medium_details (block):
        - access_key_id (optional)
        - name (optional)
        - object_storage_bucket (optional, block):
            - bucket (optional)
            - namespace (optional)
        - region (optional)
        - secret_access_key (optional)
        - shared_storage_mount_target_id (optional)
        - source (optional, block):
            - kind (required)
            - oci_home (optional)
            - wallet_location (optional)
        - target (optional, block):
            - kind (required)
            - oci_home (optional)
            - wallet_location (optional)
        - type (required)
    - exclude_objects (block):
        - is_omit_excluded_table_from_replication (optional)
        - object (required)
        - owner (optional)
        - schema (optional)
        - type (optional)
    - ggs_details (block):
        - acceptable_lag (optional)
        - extract (optional, block):
            - long_trans_duration (optional)
            - performance_profile (optional)
        - replicat (optional, block):
            - performance_profile (optional)
    - hub_details (block):
        - acceptable_lag (optional)
        - compute_id (optional)
        - extract (optional, block):
            - long_trans_duration (optional)
            - performance_profile (optional)
        - key_id (required)
        - replicat (optional, block):
            - performance_profile (optional)
        - rest_admin_credentials (required, block):
            - password (required)
            - username (required)
        - url (required)
        - vault_id (required)
    - include_objects (block):
        - is_omit_excluded_table_from_replication (optional)
        - object (required)
        - owner (optional)
        - schema (optional)
        - type (optional)
    - initial_load_settings (block):
        - compatibility (optional)
        - data_pump_parameters (optional, block):
            - estimate (optional)
            - exclude_parameters (optional)
            - export_parallelism_degree (optional)
            - import_parallelism_degree (optional)
            - is_cluster (optional)
            - table_exists_action (optional)
        - export_directory_object (optional, block):
            - name (optional)
            - path (optional)
        - handle_grant_errors (optional)
        - import_directory_object (optional, block):
            - name (optional)
            - path (optional)
        - is_consistent (optional)
        - is_ignore_existing_objects (optional)
        - is_tz_utc (optional)
        - job_mode (optional)
        - metadata_remaps (optional, block):
            - new_value (optional)
            - old_value (optional)
            - type (optional)
        - primary_key_compatibility (optional)
        - tablespace_details (optional, block):
            - block_size_in_kbs (optional)
            - extend_size_in_mbs (optional)
            - is_auto_create (optional)
            - is_big_file (optional)
            - remap_target (optional)
            - target_type (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id                          = string
    database_combination                    = string
    type                                    = string
    assessment_id                           = optional(string)
    bulk_include_exclude_data               = optional(string)
    defined_tags                            = optional(map(string))
    description                             = optional(string)
    display_name                            = optional(string)
    freeform_tags                           = optional(map(string))
    source_container_database_connection_id = optional(string)
    source_database_connection_id           = optional(string)
    source_standby_database_connection_id   = optional(string)
    target_database_connection_id           = optional(string)
    advanced_parameters = optional(list(object({
      data_type = optional(string)
      name      = optional(string)
      value     = optional(string)
    })))
    advisor_settings = optional(object({
      is_ignore_errors = optional(bool)
      is_skip_advisor  = optional(bool)
    }))
    data_transfer_medium_details = optional(object({
      access_key_id = optional(string)
      name          = optional(string)
      object_storage_bucket = optional(object({
        bucket    = optional(string)
        namespace = optional(string)
      }))
      region                         = optional(string)
      secret_access_key              = optional(string)
      shared_storage_mount_target_id = optional(string)
      source = optional(object({
        kind            = string
        oci_home        = optional(string)
        wallet_location = optional(string)
      }))
      target = optional(object({
        kind            = string
        oci_home        = optional(string)
        wallet_location = optional(string)
      }))
      type = string
    }))
    exclude_objects = optional(list(object({
      is_omit_excluded_table_from_replication = optional(bool)
      object                                  = string
      owner                                   = optional(string)
      schema                                  = optional(string)
      type                                    = optional(string)
    })))
    ggs_details = optional(object({
      acceptable_lag = optional(number)
      extract = optional(object({
        long_trans_duration = optional(number)
        performance_profile = optional(string)
      }))
      replicat = optional(object({
        performance_profile = optional(string)
      }))
    }))
    hub_details = optional(object({
      acceptable_lag = optional(number)
      compute_id     = optional(string)
      extract = optional(object({
        long_trans_duration = optional(number)
        performance_profile = optional(string)
      }))
      key_id = string
      replicat = optional(object({
        performance_profile = optional(string)
      }))
      rest_admin_credentials = object({
        password = string
        username = string
      })
      url      = string
      vault_id = string
    }))
    include_objects = optional(list(object({
      is_omit_excluded_table_from_replication = optional(bool)
      object                                  = string
      owner                                   = optional(string)
      schema                                  = optional(string)
      type                                    = optional(string)
    })))
    initial_load_settings = optional(object({
      compatibility = optional(list(string))
      data_pump_parameters = optional(object({
        estimate                  = optional(string)
        exclude_parameters        = optional(list(string))
        export_parallelism_degree = optional(number)
        import_parallelism_degree = optional(number)
        is_cluster                = optional(bool)
        table_exists_action       = optional(string)
      }))
      export_directory_object = optional(object({
        name = optional(string)
        path = optional(string)
      }))
      handle_grant_errors = optional(string)
      import_directory_object = optional(object({
        name = optional(string)
        path = optional(string)
      }))
      is_consistent              = optional(bool)
      is_ignore_existing_objects = optional(bool)
      is_tz_utc                  = optional(bool)
      job_mode                   = optional(string)
      metadata_remaps = optional(list(object({
        new_value = optional(string)
        old_value = optional(string)
        type      = optional(string)
      })))
      primary_key_compatibility = optional(string)
      tablespace_details = optional(object({
        block_size_in_kbs  = optional(string)
        extend_size_in_mbs = optional(number)
        is_auto_create     = optional(bool)
        is_big_file        = optional(bool)
        remap_target       = optional(string)
        target_type        = string
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.database_migration_migrations : (
        contains([for v in ["MYSQL", "ORACLE"] : lower(v)], lower(v.database_combination))
      )
    ])
    error_message = "must be one of: \"MYSQL\", \"ORACLE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.database_migration_migrations : (
        v.data_transfer_medium_details == null || (contains([for v in ["AWS_S3", "DBLINK", "NFS", "OBJECT_STORAGE"] : lower(v)], lower(v.data_transfer_medium_details.type)))
      )
    ])
    error_message = "must be one of: \"AWS_S3\", \"DBLINK\", \"NFS\", \"OBJECT_STORAGE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.database_migration_migrations : (
        v.data_transfer_medium_details == null || (v.data_transfer_medium_details.source == null || (contains([for v in ["CURL", "OCI_CLI"] : lower(v)], lower(v.data_transfer_medium_details.source.kind))))
      )
    ])
    error_message = "must be one of: \"CURL\", \"OCI_CLI\""
  }
  validation {
    condition = alltrue([
      for k, v in var.database_migration_migrations : (
        v.data_transfer_medium_details == null || (v.data_transfer_medium_details.target == null || (contains([for v in ["CURL", "OCI_CLI"] : lower(v)], lower(v.data_transfer_medium_details.target.kind))))
      )
    ])
    error_message = "must be one of: \"CURL\", \"OCI_CLI\""
  }
  validation {
    condition = alltrue([
      for k, v in var.database_migration_migrations : (
        v.initial_load_settings == null || (v.initial_load_settings.tablespace_details == null || (contains([for v in ["ADB_D_AUTOCREATE", "ADB_D_REMAP", "ADB_S_REMAP", "NON_ADB_AUTOCREATE", "NON_ADB_REMAP", "TARGET_DEFAULTS_AUTOCREATE", "TARGET_DEFAULTS_REMAP"] : lower(v)], lower(v.initial_load_settings.tablespace_details.target_type))))
      )
    ])
    error_message = "must be one of: \"ADB_D_AUTOCREATE\", \"ADB_D_REMAP\", \"ADB_S_REMAP\", \"NON_ADB_AUTOCREATE\", \"NON_ADB_REMAP\", \"TARGET_DEFAULTS_AUTOCREATE\", \"TARGET_DEFAULTS_REMAP\""
  }
}

