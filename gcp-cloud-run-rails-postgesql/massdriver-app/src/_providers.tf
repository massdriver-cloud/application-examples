terraform {
  required_version = ">= 1.0"
  required_providers {
    mdxc = {
      source  = "massdriver-cloud/mdxc"
      version = "0.0.6"
    }
    massdriver = {
      source = "massdriver-cloud/massdriver"
    }
    jq = {
      source = "massdriver-cloud/jq"
    }
    google = {
      source = "hashicorp/google"
    }
    google-beta = {
      source = "hashicorp/google-beta"
    }
  }
}

locals {
  gcp_project_id = var.gcp_authentication.data.project_id
}

provider "google" {
  project     = local.gcp_project_id
  credentials = jsonencode(var.gcp_authentication.data)
}

provider "google-beta" {
  project     = local.gcp_project_id
  credentials = jsonencode(var.gcp_authentication.data)
}

provider "mdxc" {
  gcp = {
    project     = local.gcp_project_id
    credentials = jsonencode(var.gcp_authentication.data)
  }
}
