terraform {
  backend "gcs" {
    bucket  = "gcp-sandbox-tf-state"
  }
}
