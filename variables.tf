variable "eventgrid_domain_topics" {
  description = <<EOT
Map of eventgrid_domain_topics, attributes below
Required:
    - domain_name
    - name
    - resource_group_name
EOT

  type = map(object({
    domain_name         = string
    name                = string
    resource_group_name = string
  }))
  validation {
    condition = alltrue([
      for k, v in var.eventgrid_domain_topics : (
        (length(v.name) > 0) && (can(regex("^[-a-zA-Z0-9]{3,128}$", v.name)))
      )
    ])
    error_message = "all of: must not be empty; EventGrid domain topic name must be 3 - 128 characters long, contain only letters, numbers and hyphens."
  }
  validation {
    condition = alltrue([
      for k, v in var.eventgrid_domain_topics : (
        (length(v.domain_name) > 0) && (can(regex("^[-a-zA-Z0-9]{3,50}$", v.domain_name)))
      )
    ])
    error_message = "all of: must not be empty; EventGrid domain name must be 3 - 50 characters long, contain only letters, numbers and hyphens."
  }
  validation {
    condition = alltrue([
      for k, v in var.eventgrid_domain_topics : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.eventgrid_domain_topics : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.eventgrid_domain_topics : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

