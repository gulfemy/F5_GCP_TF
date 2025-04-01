terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project     = var.project_id
  region = var.region
  zone = var.zone
}

#BEST 3nic 1 mgmt and internal, 1 external, 1 Hb because configsync and mgmt can not be the same
#service account mail
#instance larin zone larini ayir
#elb icin proxy-only subnet yarat
#sifre = godgj