resource "google_cloudbuild_trigger" "inf_trigger" {
  project  = "cr-space-invaders" 
  name     = "inf-trigger" 
  location = "us-central1"

  description = "Cloud Build trigger that will deploy resources on gcp"

  # Define the trigger configuration
  github {
    owner = "Stking89"
    name  = "GCP_Sandbox"
    pull_request {
      branch = "main"  // Trigger on pushes to the main branch
    }
  }

  # Specify the build configuration (optional)
  included_files = ["inf-triggers/pull-request.yamll"]  // Path to your Cloud Build configuration file

  # Additional options (optional)
  filename = "pull-request.yaml"  // Name of the build configuration file within the repository

}
