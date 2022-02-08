resource "random_pet" "pets" {
}


resource "cloudfoundry_service_instance" "elastic" {
  name         = "elastic-apm-${random_pet.pets.id}"
  space        = data.cloudfoundry_space.space.id
  service_plan = data.cloudfoundry_service.elastic.service_plans[var.elastic_plan]
  json_params  = var.elastic_options
}


resource "cloudfoundry_service_key" "elastic_key" {
  name             = "key-elastic-apm-${random_pet.pets.id}"
  service_instance = cloudfoundry_service_instance.elastic.id
}