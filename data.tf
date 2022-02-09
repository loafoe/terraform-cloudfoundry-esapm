data "cloudfoundry_org" "org" {
  name = var.cf_org
}

data "cloudfoundry_user" "user" {
  name   = var.cf_user
  org_id = data.cloudfoundry_org.org.id
}

data "cloudfoundry_domain" "app_domain" {
  name = var.cf_domain
}

data "cloudfoundry_domain" "apps_internal_domain" {
  name = "apps.internal"
}

data "cloudfoundry_service" "elastic" {
  name = var.elastic_broker
}
data "cloudfoundry_space" "space" {
  org  = data.cloudfoundry_org.org.id
  name = var.cf_space
}