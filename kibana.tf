module "kibana" {
  source = "github.com/philips-labs/terraform-cloudfoundry-kibana"
  version = ">= 0.1.0"

  count         = var.enable_kibana ? 1 : 0
  kibana_image = var.kibana_image
  cf_space      = cloudfoundry_space.space.name
  cf_org        = data.cloudfoundry_org.org.name
  cf_domain     = data.cloudfoundry_domain.app_domain.name
  name_postfix  = random_id.id.hex

  environment = {
    ELASTICSEARCH_HOSTS = "https://${cloudfoundry_service_key.elastic_key.credentials.hostname}:${cloudfoundry_service_key.elastic_key.credentials.port}"
    ELASTICSEARCH_USERNAME = cloudfoundry_service_key.elastic_key.credentials.username
    ELASTICSEARCH_PASSWORD = cloudfoundry_service_key.elastic_key.credentials.password

  }
}
