locals {
  postfix = "esapm-${random_pet.pets.id}"
}
module "kibana" {
  source  = "philips-labs/kibana/cloudfoundry"
  version = "0.4.0"

  count        = var.enable_kibana ? 1 : 0
  kibana_image = var.kibana_image
  cf_space     = data.cloudfoundry_space.space.name
  cf_org       = data.cloudfoundry_org.org.name
  cf_domain    = data.cloudfoundry_domain.app_domain.name
  name_postfix = local.postfix

  environment = merge({
    ELASTICSEARCH_HOSTS    = "https://${cloudfoundry_service_key.elastic_key.credentials.hostname}:${cloudfoundry_service_key.elastic_key.credentials.port}"
    ELASTICSEARCH_USERNAME = cloudfoundry_service_key.elastic_key.credentials.username
    ELASTICSEARCH_PASSWORD = cloudfoundry_service_key.elastic_key.credentials.password
  },var.kibana_encryption_key!="" ?{
    XPACK_ENCRYPTEDSAVEDOBJECTS_ENCRYPTIONKEY = var.kibana_encryption_key
  }:{})
}
