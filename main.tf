resource "oci_database_migration_migration" "database_migration_migrations" {
  for_each = var.database_migration_migrations

  compartment_id                          = each.value.compartment_id
  database_combination                    = each.value.database_combination
  type                                    = each.value.type
  assessment_id                           = each.value.assessment_id
  bulk_include_exclude_data               = each.value.bulk_include_exclude_data
  defined_tags                            = each.value.defined_tags
  description                             = each.value.description
  display_name                            = each.value.display_name
  freeform_tags                           = each.value.freeform_tags
  source_container_database_connection_id = each.value.source_container_database_connection_id
  source_database_connection_id           = each.value.source_database_connection_id
  source_standby_database_connection_id   = each.value.source_standby_database_connection_id
  target_database_connection_id           = each.value.target_database_connection_id

  dynamic "advanced_parameters" {
    for_each = each.value.advanced_parameters != null ? each.value.advanced_parameters : []
    content {
      data_type = advanced_parameters.value.data_type
      name      = advanced_parameters.value.name
      value     = advanced_parameters.value.value
    }
  }

  dynamic "advisor_settings" {
    for_each = each.value.advisor_settings != null ? [each.value.advisor_settings] : []
    content {
      is_ignore_errors = advisor_settings.value.is_ignore_errors
      is_skip_advisor  = advisor_settings.value.is_skip_advisor
    }
  }

  dynamic "data_transfer_medium_details" {
    for_each = each.value.data_transfer_medium_details != null ? [each.value.data_transfer_medium_details] : []
    content {
      access_key_id = data_transfer_medium_details.value.access_key_id
      name          = data_transfer_medium_details.value.name
      dynamic "object_storage_bucket" {
        for_each = data_transfer_medium_details.value.object_storage_bucket != null ? [data_transfer_medium_details.value.object_storage_bucket] : []
        content {
          bucket    = object_storage_bucket.value.bucket
          namespace = object_storage_bucket.value.namespace
        }
      }
      region                         = data_transfer_medium_details.value.region
      secret_access_key              = data_transfer_medium_details.value.secret_access_key
      shared_storage_mount_target_id = data_transfer_medium_details.value.shared_storage_mount_target_id
      dynamic "source" {
        for_each = data_transfer_medium_details.value.source != null ? [data_transfer_medium_details.value.source] : []
        content {
          kind            = source.value.kind
          oci_home        = source.value.oci_home
          wallet_location = source.value.wallet_location
        }
      }
      dynamic "target" {
        for_each = data_transfer_medium_details.value.target != null ? [data_transfer_medium_details.value.target] : []
        content {
          kind            = target.value.kind
          oci_home        = target.value.oci_home
          wallet_location = target.value.wallet_location
        }
      }
      type = data_transfer_medium_details.value.type
    }
  }

  dynamic "exclude_objects" {
    for_each = each.value.exclude_objects != null ? each.value.exclude_objects : []
    content {
      is_omit_excluded_table_from_replication = exclude_objects.value.is_omit_excluded_table_from_replication
      object                                  = exclude_objects.value.object
      owner                                   = exclude_objects.value.owner
      schema                                  = exclude_objects.value.schema
      type                                    = exclude_objects.value.type
    }
  }

  dynamic "ggs_details" {
    for_each = each.value.ggs_details != null ? [each.value.ggs_details] : []
    content {
      acceptable_lag = ggs_details.value.acceptable_lag
      dynamic "extract" {
        for_each = ggs_details.value.extract != null ? [ggs_details.value.extract] : []
        content {
          long_trans_duration = extract.value.long_trans_duration
          performance_profile = extract.value.performance_profile
        }
      }
      dynamic "replicat" {
        for_each = ggs_details.value.replicat != null ? [ggs_details.value.replicat] : []
        content {
          performance_profile = replicat.value.performance_profile
        }
      }
    }
  }

  dynamic "hub_details" {
    for_each = each.value.hub_details != null ? [each.value.hub_details] : []
    content {
      acceptable_lag = hub_details.value.acceptable_lag
      compute_id     = hub_details.value.compute_id
      dynamic "extract" {
        for_each = hub_details.value.extract != null ? [hub_details.value.extract] : []
        content {
          long_trans_duration = extract.value.long_trans_duration
          performance_profile = extract.value.performance_profile
        }
      }
      key_id = hub_details.value.key_id
      dynamic "replicat" {
        for_each = hub_details.value.replicat != null ? [hub_details.value.replicat] : []
        content {
          performance_profile = replicat.value.performance_profile
        }
      }
      rest_admin_credentials {
        password = hub_details.value.rest_admin_credentials.password
        username = hub_details.value.rest_admin_credentials.username
      }
      url      = hub_details.value.url
      vault_id = hub_details.value.vault_id
    }
  }

  dynamic "include_objects" {
    for_each = each.value.include_objects != null ? each.value.include_objects : []
    content {
      is_omit_excluded_table_from_replication = include_objects.value.is_omit_excluded_table_from_replication
      object                                  = include_objects.value.object
      owner                                   = include_objects.value.owner
      schema                                  = include_objects.value.schema
      type                                    = include_objects.value.type
    }
  }

  dynamic "initial_load_settings" {
    for_each = each.value.initial_load_settings != null ? [each.value.initial_load_settings] : []
    content {
      compatibility = initial_load_settings.value.compatibility
      dynamic "data_pump_parameters" {
        for_each = initial_load_settings.value.data_pump_parameters != null ? [initial_load_settings.value.data_pump_parameters] : []
        content {
          estimate                  = data_pump_parameters.value.estimate
          exclude_parameters        = data_pump_parameters.value.exclude_parameters
          export_parallelism_degree = data_pump_parameters.value.export_parallelism_degree
          import_parallelism_degree = data_pump_parameters.value.import_parallelism_degree
          is_cluster                = data_pump_parameters.value.is_cluster
          table_exists_action       = data_pump_parameters.value.table_exists_action
        }
      }
      dynamic "export_directory_object" {
        for_each = initial_load_settings.value.export_directory_object != null ? [initial_load_settings.value.export_directory_object] : []
        content {
          name = export_directory_object.value.name
          path = export_directory_object.value.path
        }
      }
      handle_grant_errors = initial_load_settings.value.handle_grant_errors
      dynamic "import_directory_object" {
        for_each = initial_load_settings.value.import_directory_object != null ? [initial_load_settings.value.import_directory_object] : []
        content {
          name = import_directory_object.value.name
          path = import_directory_object.value.path
        }
      }
      is_consistent              = initial_load_settings.value.is_consistent
      is_ignore_existing_objects = initial_load_settings.value.is_ignore_existing_objects
      is_tz_utc                  = initial_load_settings.value.is_tz_utc
      job_mode                   = initial_load_settings.value.job_mode
      dynamic "metadata_remaps" {
        for_each = initial_load_settings.value.metadata_remaps != null ? initial_load_settings.value.metadata_remaps : []
        content {
          new_value = metadata_remaps.value.new_value
          old_value = metadata_remaps.value.old_value
          type      = metadata_remaps.value.type
        }
      }
      primary_key_compatibility = initial_load_settings.value.primary_key_compatibility
      dynamic "tablespace_details" {
        for_each = initial_load_settings.value.tablespace_details != null ? [initial_load_settings.value.tablespace_details] : []
        content {
          block_size_in_kbs  = tablespace_details.value.block_size_in_kbs
          extend_size_in_mbs = tablespace_details.value.extend_size_in_mbs
          is_auto_create     = tablespace_details.value.is_auto_create
          is_big_file        = tablespace_details.value.is_big_file
          remap_target       = tablespace_details.value.remap_target
          target_type        = tablespace_details.value.target_type
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

