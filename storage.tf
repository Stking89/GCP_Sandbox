resource "google_storage_bucket" "tf-state" {
    name                        = "gcp-sandbox-tf-state"
    location                    = "us-central1"
    project                     = "cr-space-invaders"
    uniform_bucket_level_access = true
}