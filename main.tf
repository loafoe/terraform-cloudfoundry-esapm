resource "random_id" "id" {
  byte_length = 8
}

locals {
  space_name = "esapm-${random_id.id.hex}"
}

resource "cloudfoundry_space" "space" {
  org  = data.cloudfoundry_org.org.id
  name = local.space_name
}

resource "cloudfoundry_space_users" "users" {
  space      = cloudfoundry_space.space.id
  managers   = [data.cloudfoundry_user.user.id]
  developers = [data.cloudfoundry_user.user.id]
  auditors   = [data.cloudfoundry_user.user.id]
}

resource "cloudfoundry_service_instance" "elastic" {
  name  = "elastic-apm"
  space = cloudfoundry_space.space.id
  service_plan  = data.cloudfoundry_service.elastic.service_plans[var.elastic_plan]
  json_params = var.elastic_options

  depends_on = [cloudfoundry_space_users.users]
}

resource "cloudfoundry_service_key" "elastic_key" {
  name = "key"
  service_instance = cloudfoundry_service_instance.elastic.id
}