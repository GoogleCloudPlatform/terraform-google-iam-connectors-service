# terraform-google-iam-connectors-service

## Description

Terraform module for managing Google Cloud IAM Connectors. This module provides a convenient way to create and configure IAM connectors with support for multiple authentication types including API Key, Three-legged OAuth, Two-legged OAuth, and Gemini Enterprise connectors.

~> **Warning:** All arguments including the following potentially sensitive
values will be stored in the raw state as plain text: `connector_type_params.three_legged_oauth.client_secret`, `connector_type_params.two_legged_oauth.client_secret`, `connector_type_params.api_key.api_key`.
[Read more about sensitive data in state](https://developer.hashicorp.com/terraform/language/manage-sensitive-data).

## Example Usage - IAM Connectors Connector Basic

This example demonstrates how to create a basic IAM connector with API Key authentication.

```hcl
resource "google_iam_connectors_connector" "default" {
  location       = "europe-west4"
  connector_id   = "connector"

  connector_type_params {
    api_key {
      api_key = "foobar"
    }
  }
}
```
## Example Usage - IAM Connectors Connector Gemini Enterprise

This example demonstrates how to create a Gemini Enterprise connector for advanced AI and automation integrations.

```hcl
resource "google_iam_connectors_connector" "default" {
  location       = "europe-west4"
  connector_id   = "connector"

  connector_type_params {
    ge_connector_params {}
  }
}
```
## Example Usage - IAM Connectors Connector Three Legged OAuth

This example demonstrates how to create a connector with Three-legged OAuth authentication, enabling user-authorized access to third-party APIs.

```hcl
resource "google_iam_connectors_connector" "default" {
  location       = "europe-west4"
  connector_id   = "connector"

  allowed_scopes = ["https://www.googleapis.com/auth/cloud-platform", "https://www.googleapis.com/auth/userinfo.email"]

  connector_type_params {
    three_legged_oauth {
      client_id = "foo"
      client_secret = "bar"
      authorization_url = "baz"
      token_url = "qux"
    }
  }
}
```
## Example Usage - IAM Connectors Connector Two Legged OAuth

This example demonstrates how to create a connector with Two-legged OAuth authentication for direct service-to-service communication.

```hcl
resource "google_iam_connectors_connector" "default" {
  location       = "europe-west4"
  connector_id   = "connector"

  allowed_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  blocked_scopes = ["https://www.googleapis.com/auth/userinfo.email"]

  connector_type_params {
    two_legged_oauth {
      client_id = "foo"
      client_secret = "bar"
      token_endpoint = "qux"
    }
  }
}
```

## Timeouts

The following timeout configuration options are available for managing resource creation, updates, and deletals:

This resource provides the following
[Timeouts](https://developer.hashicorp.com/terraform/plugin/sdkv2/resources/retries-and-customizable-timeouts) configuration options:

- `create` - Default is 20 minutes.
- `update` - Default is 20 minutes.
- `delete` - Default is 20 minutes.

## Import

This section explains how to import existing IAM connectors into Terraform state. The connector can be imported using any of the accepted formats below:

Connector can be imported using any of these accepted formats:

* `projects/{{project}}/locations/{{location}}/services/{{connector_id}}`
* `{{project}}/{{location}}/{{connector_id}}`
* `{{location}}/{{connector_id}}`


In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) to import Connector using one of the formats above. For example:

```tf
import {
  id = "projects/{{project}}/locations/{{location}}/services/{{connector_id}}"
  to = google_iam_connectors_connector.default
}
```

When using the [`terraform import` command](https://developer.hashicorp.com/terraform/cli/commands/import), Connector can be imported using one of the formats above. For example:

```
$ terraform import google_iam_connectors_connector.default projects/{{project}}/locations/{{location}}/services/{{connector_id}}
$ terraform import google_iam_connectors_connector.default {{project}}/{{location}}/{{connector_id}}
$ terraform import google_iam_connectors_connector.default {{location}}/{{connector_id}}
```

## User Project Overrides

This resource supports the User Project Override feature, which allows you to specify a different project for resource billing and quota tracking than the one configured in the provider.

This resource supports [User Project Overrides](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#user_project_override).

## Requirements

This section outlines the prerequisites and requirements needed to use this module.

### Software
- [Terraform](https://www.terraform.io/downloads.html) v1.3.0+
- [Terraform Provider for GCP](https://registry.terraform.io/providers/hashicorp/google/latest) v5.1.0+

### Service Account Roles
The service account used to provision this module requires the following IAM roles:
- **IAM Connectors Admin**: `roles/iamconnectors.admin`
- **Service Account User**: `roles/iam.serviceAccountUser`
- **Secret Manager Secret Accessor**: `roles/secretmanager.secretAccessor`
- **Connector Admin**: `roles/connectors.admin`

### APIs
The following APIs must be enabled in the target project:
- **IAM Connectors API**: `iamconnectors.googleapis.com`
- **Secret Manager API**: `secretmanager.googleapis.com`
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
| connector\_self\_link | The full resource name of the created IAM connector. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
