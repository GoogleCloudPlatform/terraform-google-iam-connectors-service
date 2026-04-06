// Copyright 2022 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package simple_example

import (
	"testing"

	"github.com/GoogleCloudPlatform/cloud-foundation-toolkit/infra/blueprint-test/pkg/tft"
	"github.com/stretchr/testify/assert"
)

func TestSimpleExample(t *testing.T) {
	example := tft.NewTFBlueprintTest(t,tft.WithTFDir("../../../examples/simple_example"))

	example.DefineVerify(func(assert *assert.Assertions) {
		example.DefaultVerify(assert)

		connectorID := example.GetStringOutput("id")
    	assert.NotEmpty(connectorID, "Connector ID should not be empty")
		
		// skipping this part of the test of verifying the connector details through gcloud command since the API is not available in cft/developer-tools docker Image.
		// projectID := example.GetStringOutput("project_id")
		// location := "us-central1"

		// connectorOp := gcloud.Runf(t, "alpha iam-connectors describe %s --project %s --location %s", connectorID, projectID, location)

		// expectedName := fmt.Sprintf("projects/%s/locations/%s/connectors/%s", projectID, location, connectorID)
		// assert.Equal(expectedName, connectorOp.Get("name").String(), "IAM Connector full name should match")

		// assert.Equal("ENABLED", connectorOp.Get("state").String(), "IAM Connector state should be ENABLED")
	})

	example.Test()
}
