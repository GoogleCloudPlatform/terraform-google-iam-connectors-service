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

variable "project_id" {
  type        = string
  description = "The ID of the project to create the connector in."
}

variable "location" {
  description = "The location of the resource."
  type        = string
}

variable "connector_id" {
  description = "The name of the connector."
  type        = string
}

variable "description" {
  description = "The description of the resource."
  type        = string
  default     = null
}

variable "allowed_scopes" {
  description = "List of scopes that are allowed to be requested for this connector."
  type        = list(string)
  default     = []
}

variable "blocked_scopes" {
  description = "List of scopes that are blocked from being requested for this connector."
  type        = list(string)
  default     = []
}

variable "api_key_params" {
  description = "API Key connector type parameters."
  type = object({
    api_key = string
  })
  default = null
}

variable "three_legged_oauth_params" {
  description = "Three-legged OAuth connector type parameters."
  type = object({
    client_id         = string
    client_secret     = string
    authorization_url = string
    token_url         = string
  })
  default = null
}

variable "two_legged_oauth_params" {
  description = "Two-legged OAuth connector type parameters."
  type = object({
    client_id      = string
    client_secret  = string
    token_endpoint = string
  })
  default = null
}

variable "ge_connector_params" {
  description = "Gemini Enterprise connector type parameters. Set to an empty object to enable."
  type        = any
  default     = null
}

variable "state" {
  description = "The state of the connector. Can be ENABLED or DISABLED."
  type        = string
  default     = "ENABLED"
  validation {
    condition     = contains(["ENABLED", "DISABLED"], var.state)
    error_message = "The state must be either ENABLED or DISABLED."
  }
}
