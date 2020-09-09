variable "cf_org" {
  description = "Cloudfoundry ORG name to deploy to"
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

variable "enable_grafana" {
  description = "Adds a Grafana deployment when enabled"
  type        = bool
  default     = false
}

variable "grafana_image" {
  description = "Image to use for Grafana"
  default     = "grafana/grafana:latest"
  type        = string
}
