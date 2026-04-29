/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


resource "google_iam_connectors_connector" "default" {
  provider = google-nightly

  project        = var.project_id
  location       = var.location
  connector_id   = var.connector_id
  description    = var.description
  allowed_scopes = var.allowed_scopes
  blocked_scopes = var.blocked_scopes
  state          = var.state
  dynamic "connector_type_params" {
    for_each = var.api_key_params != null || var.three_legged_oauth_params != null || var.two_legged_oauth_params != null || var.ge_connector_params != null ? [1] : []
    content {
      dynamic "api_key" {
        for_each = var.api_key_params != null ? [var.api_key_params] : []
        content {
          api_key = api_key.value.api_key
        }
      }
      dynamic "three_legged_oauth" {
        for_each = var.three_legged_oauth_params != null ? [var.three_legged_oauth_params] : []
        content {
          client_id         = three_legged_oauth.value.client_id
          client_secret     = three_legged_oauth.value.client_secret
          authorization_url = three_legged_oauth.value.authorization_url
          token_url         = three_legged_oauth.value.token_url
          enable_pkce       = three_legged_oauth.value.enable_pkce
        }
      }
      dynamic "two_legged_oauth" {
        for_each = var.two_legged_oauth_params != null ? [var.two_legged_oauth_params] : []
        content {
          client_id      = two_legged_oauth.value.client_id
          client_secret  = two_legged_oauth.value.client_secret
          token_endpoint = two_legged_oauth.value.token_endpoint
        }
      }
      dynamic "ge_connector_params" {
        for_each = var.ge_connector_params != null ? [var.ge_connector_params] : []
        content {}
      }
    }
  }
  lifecycle {
    precondition {
      condition     = var.project_id != null
      error_message = "project_id must be provided."
    }

    precondition {
      condition     = var.location != null
      error_message = "location must be provided."
    }

    precondition {
      condition     = var.connector_id != null
      error_message = "connector_id must be provided."
    }
    precondition {
      condition     = var.api_key_params != null || var.three_legged_oauth_params != null || var.two_legged_oauth_params != null || var.ge_connector_params != null
      error_message = "At least one of api_key_params, three_legged_oauth_params, two_legged_oauth_params, or ge_connector_params must be provided."
    }
  }
}
