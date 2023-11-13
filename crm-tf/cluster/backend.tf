terraform {
  backend "s3" {
    endpoints                    = { s3 = "https://sfo3.digitaloceanspaces.com"}
    key                         = "cluster/terraform.tfstate"
    bucket                      = "terraform-crm" 
    region                      = "us-west-1"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    skip_region_validation      = true
    skip_s3_checksum            = true
  }
}

provider "digitalocean" {
  token = var.token
  spaces_endpoint   = "https://sfo3.digitaloceanspaces.com"
}

terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

