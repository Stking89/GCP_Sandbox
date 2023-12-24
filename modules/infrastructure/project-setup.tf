#---------------------------------------------------------------------------------------------------------------------------
#
#                                               Project SetUp
# - Deploy new GCP projects
# - Enable all needed APIS
#---------------------------------------------------------------------------------------------------------------------------

locals {
  google_apis = {
    "compute"                       = "compute.googleapis.com"
    "cloudresourcemanager"          = "cloudresourcemanager.googleapis.com"
    "storage"                       = "storage-api.googleapis.com"
    "iam"                           = "iam.googleapis.com"
    "cloudbilling"                  = "cloudbilling.googleapis.com"
    "cloudrun"                      = "run.googleapis.com"
    "cloudbuild"                    = "cloudbuild.googleapis.com"
    "secretmanager"                 = "secretmanager.googleapis.com"
  }
}


#---Enable APIs--- 

resource "google_project_service" "enabled_apis" {
    for_each = local.google_apis

  project = var.project_id
  service = each.value
}
