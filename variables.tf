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
  # --- Unconfirmed validation candidates, derived from azurerm_eventgrid_domain_topic's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validation.All(...) - no translation rule yet, add one
  # path: domain_name
  #   source:    validation.All(...) - no translation rule yet, add one
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
}

