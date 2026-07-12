output "eventgrid_domain_topics_id" {
  description = "Map of id values across all eventgrid_domain_topics, keyed the same as var.eventgrid_domain_topics"
  value       = { for k, v in azurerm_eventgrid_domain_topic.eventgrid_domain_topics : k => v.id }
}
output "eventgrid_domain_topics_domain_name" {
  description = "Map of domain_name values across all eventgrid_domain_topics, keyed the same as var.eventgrid_domain_topics"
  value       = { for k, v in azurerm_eventgrid_domain_topic.eventgrid_domain_topics : k => v.domain_name }
}
output "eventgrid_domain_topics_name" {
  description = "Map of name values across all eventgrid_domain_topics, keyed the same as var.eventgrid_domain_topics"
  value       = { for k, v in azurerm_eventgrid_domain_topic.eventgrid_domain_topics : k => v.name }
}
output "eventgrid_domain_topics_resource_group_name" {
  description = "Map of resource_group_name values across all eventgrid_domain_topics, keyed the same as var.eventgrid_domain_topics"
  value       = { for k, v in azurerm_eventgrid_domain_topic.eventgrid_domain_topics : k => v.resource_group_name }
}

