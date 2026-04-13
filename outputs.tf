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

output "connector" {
  value       = google_iam_connectors_connector.default
  description = "The created IAM connector."
}

output "connector_id" {
  description = "The ID of the created IAM connector."
  value       = google_iam_connectors_connector.default.id
}

output "connector_self_link" {
  description = "The full resource name of the created IAM connector."
  value       = "projects/${google_iam_connectors_connector.default.project}/locations/${google_iam_connectors_connector.default.location}/connectors/${google_iam_connectors_connector.default.connector_id}"
}
