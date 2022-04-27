variable "cf_org" {
  description = "Cloudfoundry ORG name to deploy to"
  type        = string
}
variable "cf_space" {
  description = "Cloudfoundry space name to deploy to"
  type        = string
}
variable "cf_domain" {
  description = "The Cloudfoundry regular app domain to use"
  type        = string
}

variable "cf_user" {
  description = "The Cloudfoundry user to assign rights to the app to"
  type        = string
}

variable "elastic_broker" {
  description = "The Elastic broker to use"
  type        = string
  default     = "hsdp-elastic"
}

variable "elastic_plan" {
  description = "The elastic plan to use"
  type        = string
  default     = "es7-dev-1"
}

variable "elastic_options" {
  description = "Options to pass when creating Elastic cluster"
  type        = string
  default     = <<EOF
  {"EnableAPMServer": true}
EOF
}

variable "enable_kibana" {
  description = "Adds a Kibana deployment when enabled"
  type        = bool
  default     = true
}

variable "kibana_image" {
  description = "Image to use for Grafana"
  default     = "docker.elastic.co/kibana/kibana:7.7.1"
  type        = string
}
variable "kibana_encryption_key" {
  description = "Encryption key to enable alerts in Kibana"
  default     = ""
  type        = string
  # example: 2751772b-5e27-41f4-adf7-b7322260e5f8
}
