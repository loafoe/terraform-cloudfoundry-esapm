

output "kibana_endpoint" {
  value = module.kibana[0].kibana_endpoint
}
output "hostname" {
  value = cloudfoundry_service_key.elastic_key.credentials.hostname
}
output "username" {
  value = cloudfoundry_service_key.elastic_key.credentials.username
}
output "password" {
  sensitive = true
  value     = cloudfoundry_service_key.elastic_key.credentials.password
}


output "apm_secret_token" {
  sensitive = true
  value     = cloudfoundry_service_key.elastic_key.credentials.secret_token
}

output "apm_url" {
  value = cloudfoundry_service_key.elastic_key.credentials.server_urls

}