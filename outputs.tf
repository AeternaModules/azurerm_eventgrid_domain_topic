output "eventgrid_domain_topics" {
  description = "All eventgrid_domain_topic resources"
  value       = azurerm_eventgrid_domain_topic.eventgrid_domain_topics
}
output "eventgrid_domain_topics_domain_name" {
  description = "List of domain_name values across all eventgrid_domain_topics"
  value       = [for k, v in azurerm_eventgrid_domain_topic.eventgrid_domain_topics : v.domain_name]
}
output "eventgrid_domain_topics_name" {
  description = "List of name values across all eventgrid_domain_topics"
  value       = [for k, v in azurerm_eventgrid_domain_topic.eventgrid_domain_topics : v.name]
}
output "eventgrid_domain_topics_resource_group_name" {
  description = "List of resource_group_name values across all eventgrid_domain_topics"
  value       = [for k, v in azurerm_eventgrid_domain_topic.eventgrid_domain_topics : v.resource_group_name]
}

