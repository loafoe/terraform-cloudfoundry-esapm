<img src="https://cdn.rawgit.com/hashicorp/terraform-website/master/content/source/assets/images/logo-hashicorp.svg" width="500px">

# terraform-cloudfoundry-esapm
Creates an Elastic cluster with APM enabled and deploy Kibana configured for use with the cluster

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| cloudfoundry | >= 0.12.4 |
| random | >= 2.2.1 |

## Providers

| Name | Version |
|------|---------|
| cloudfoundry | >= 0.12.4 |
| random | >= 2.2.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cf\_domain | The Cloudfoundry regular app domain to use | `string` | n/a | yes |
| cf\_org | Cloudfoundry ORG name to deploy to | `string` | n/a | yes |
| cf\_user | The Cloudfoundry user to assign rights to the app to | `string` | n/a | yes |
| elastic\_broker | The Elastic broker to use | `string` | `"hsdp-elastic"` | no |
| elastic\_options | Options to pass when creating Elastic cluster | `string` | `"  {\"EnableAPMServer\": true}\n"` | no |
| elastic\_plan | The elastic plan to use | `string` | `"es7-dev-1"` | no |
| enable\_kibana | Adds a Kibana deployment when enabled | `bool` | `true` | no |
| kibana\_image | Image to use for Grafana | `string` | `"docker.elastic.co/kibana/kibana:7.7.1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| apm\_secret\_token | n/a |
| apm\_url | n/a |
| hostname | n/a |
| kibana\_endpoint | n/a |
| name | n/a |
| password | n/a |
| username | n/a |

# Contact / Getting help
andy.lo-a-foe@philips.com

# License
License is MIT
