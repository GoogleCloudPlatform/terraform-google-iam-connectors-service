# terraform-google-iam-connectors-service

## Description
### Tagline
This is an auto-generated module.

### Detailed
This module was generated from [terraform-google-module-template](https://github.com/terraform-google-modules/terraform-google-module-template/), which by default generates a module that simply creates a GCS bucket. As the module develops, this README should be updated.

The resources/services/activations/deletions that this module will create/trigger are:

- Create a GCS bucket with the provided name

### PreDeploy
To deploy this blueprint you must have an active billing account and billing permissions.

## Architecture
![alt text for diagram](https://www.link-to-architecture-diagram.com)
1. Architecture description step no. 1
2. Architecture description step no. 2
3. Architecture description step no. N

## Documentation
- [Hosting a Static Website](https://cloud.google.com/storage/docs/hosting-static-website)

## Deployment Duration
Configuration: X mins
Deployment: Y mins

## Cost
[Blueprint cost details](https://cloud.google.com/products/calculator?id=02fb0c45-cc29-4567-8cc6-f72ac9024add)

## Usage

Basic usage of this module is as follows:

```hcl
module "iam_connector" {
  source  = "terraform-google-modules/iam_connector/google"
  version = "~> 0.1"

  project_id  = "<PROJECT ID>"
  bucket_name = "gcs-test-bucket"
}
```

Functional examples are included in the
[examples](./examples/) directory.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allowed\_scopes | List of scopes that are allowed to be requested for this connector. | `list(string)` | `[]` | no |
| api\_key\_params | API Key connector type parameters. | <pre>object({<br>    api_key = string<br>  })</pre> | `null` | no |
| blocked\_scopes | List of scopes that are blocked from being requested for this connector. | `list(string)` | `[]` | no |
| connector\_id | The name of the connector. | `string` | n/a | yes |
| description | The description of the resource. | `string` | `null` | no |
| ge\_connector\_params | Gemini Enterprise connector type parameters. Set to an empty object to enable. | `any` | `null` | no |
| location | The location of the resource. | `string` | n/a | yes |
| project\_id | The ID of the project to create the connector in. | `string` | n/a | yes |
| state | The state of the connector. Can be ENABLED or DISABLED. | `string` | `"ENABLED"` | no |
| three\_legged\_oauth\_params | Three-legged OAuth connector type parameters. | <pre>object({<br>    client_id         = string<br>    client_secret     = string<br>    authorization_url = string<br>    token_url         = string<br>  })</pre> | `null` | no |
| two\_legged\_oauth\_params | Two-legged OAuth connector type parameters. | <pre>object({<br>    client_id      = string<br>    client_secret  = string<br>    token_endpoint = string<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| connector | The created IAM connector. |
| connector\_id | The ID of the created IAM connector. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform][terraform] v0.13
- [Terraform Provider for GCP][terraform-provider-gcp] plugin v3.0

### Service Account

A service account with the following roles must be used to provision
the resources of this module:

- Storage Admin: `roles/storage.admin`

The [Project Factory module][project-factory-module] and the
[IAM module][iam-module] may be used in combination to provision a
service account with the necessary roles applied.

### APIs

A project with the following APIs enabled must be used to host the
resources of this module:

- Google Cloud Storage JSON API: `storage-api.googleapis.com`

The [Project Factory module][project-factory-module] can be used to
provision a project with the necessary APIs enabled.

## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for
information on contributing to this module.

[iam-module]: https://registry.terraform.io/modules/terraform-google-modules/iam/google
[project-factory-module]: https://registry.terraform.io/modules/terraform-google-modules/project-factory/google
[terraform-provider-gcp]: https://www.terraform.io/docs/providers/google/index.html
[terraform]: https://www.terraform.io/downloads.html

## Security Disclosures

Please see our [security disclosure process](./SECURITY.md).
