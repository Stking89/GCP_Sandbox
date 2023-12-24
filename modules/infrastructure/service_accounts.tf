#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#
#                                                                               (Service Accounts)
#
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# 1 Add the service account id/display-name below (naming convention <resource-sa)
locals {
  service-account-id = [
    "cloud-build-sa",
    "compute-engine-sa",
    "cloud-run-sa"
  ]
}

# 2 Add list of role to the appropriate <resource-roles> key-value pair. Create one if needed & add roles, link to roles "https://cloud.google.com/iam/docs/understanding-roles#cloud-run-roles"

locals {
  cloud-build-roles = [
    "roles/cloudbuild.builds.builder",
    "roles/artifactregistry.admin" 
  ]
  compute-engine-roles = [
    "roles/compute.admin"
  ]
  cloud-run-roles = [
    "roles/run.admin",
    "roles/run.invoker",
    "roles/artifactregistry.admin"
  ]
}

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


resource "google_service_account" "service_accounts" {
  project      = var.project_id
  for_each     = toset(local.service-account-id)
  account_id   = each.value
  display_name = each.value

}

output "service_account_email" {
  value = google_service_account.service_accounts
}


#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

resource "google_project_iam_member" "cloud_build_roles" {
  project  = var.project_id
  member   = "serviceAccount:cloud-build-sa@${var.project_id}.iam.gserviceaccount.com"
  for_each = toset(local.cloud-build-roles)
  role     = each.value

  
}

resource "google_project_iam_member" "cloud_run_roles" {
  project = var.project_id
  member  = 
  
}