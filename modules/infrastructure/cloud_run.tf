resource "google_artifact_registry_repository" "docker-repo" {
  location      = "us-central1"  
  repository_id = "docker-repo"
  format        = "DOCKER"
  description   = "My Docker repository to store varies images"
}