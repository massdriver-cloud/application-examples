# Claudine

This is an example application that uses the Azure Cognitive Service to provide sentiment analysis and token extraction. The application source code can be found [here](https://github.com/massdriver-cloud/claudine). The public Docker image can be found [here](https://hub.docker.com/repository/docker/massdrivercloud/claudine).

## Massdriver `azure-function-app` Template

The `azure-function-app` template will run your application on Azure Cloud via Azure Function Apps.

**Files**:

* a [terraform module](./src) is included that configurings IAM permissions and sets up you environment variables. You likely _do not_ need to modify these files. This module is simply rigging code to integrate with Massdriver Cloud. Values that you do not want to change across targets (e.g.: your image repository) can be hard coded in the [src/main.tf](./src/main.tf) file.
* the [`massdriver.yaml`](./massdriver.yaml) controls the UI to expose for configuring your application and its dependencies. By default there are a lof of fields in your [`params`](https://docs.massdriver.cloud/bundles/configuration#bundle-params) section, feel free to remove fields that you do not want exposed in your configuration form in Massdriver Cloud.
