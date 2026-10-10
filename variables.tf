variable "dms_replication_instances" {
  description = <<EOT
Map of dms_replication_instances, attributes below
Required:
    - replication_instance_class
    - replication_instance_id
Optional:
    - allocated_storage
    - allow_major_version_upgrade
    - apply_immediately
    - auto_minor_version_upgrade
    - availability_zone
    - dns_name_servers
    - engine_version
    - kms_key_arn
    - multi_az
    - network_type
    - preferred_maintenance_window
    - publicly_accessible
    - region
    - replication_subnet_group_id
    - tags
    - tags_all
    - vpc_security_group_ids
    - kerberos_authentication_settings (block):
        - key_cache_secret_iam_arn (required)
        - key_cache_secret_id (required)
        - krb5_file_contents (required)
EOT

  type = map(object({
    replication_instance_class   = string
    replication_instance_id      = string
    tags                         = optional(map(string))
    replication_subnet_group_id  = optional(string)
    region                       = optional(string)
    publicly_accessible          = optional(bool)
    preferred_maintenance_window = optional(string)
    network_type                 = optional(string)
    multi_az                     = optional(bool)
    kms_key_arn                  = optional(string)
    engine_version               = optional(string)
    dns_name_servers             = optional(string)
    availability_zone            = optional(string)
    auto_minor_version_upgrade   = optional(bool)
    apply_immediately            = optional(bool)
    allow_major_version_upgrade  = optional(bool)
    allocated_storage            = optional(number)
    tags_all                     = optional(map(string))
    vpc_security_group_ids       = optional(set(string))
    kerberos_authentication_settings = optional(object({
      key_cache_secret_iam_arn = string
      key_cache_secret_id      = string
      krb5_file_contents       = string
    }))
  }))
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

