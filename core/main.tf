#---------------------------------------------------------------------------------------------------------------------------
#
#                           This Module Dowloands the necessary Cloud Providrs 
#---------------------------------------------------------------------------------------------------------------------------

provider "google" {
  project     = "cr-space-invaders"
  region      = "us-central1"
}

module "infrastructure" {
  source = "../modules/infrastructure"
}