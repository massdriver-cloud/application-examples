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

provider "mdxc" {
  gcp = {
    project     = var.gcp_authentication.data.project_id
    credentials = jsonencode(var.gcp_authentication.data)
  }
}

provider "google" {
  project     = var.gcp_authentication.data.project_id
  credentials = jsonencode(var.gcp_authentication.data)
}

provider "google-beta" {
  project     = var.gcp_authentication.data.project_id
  credentials = jsonencode(var.gcp_authentication.data)
}
