resource "google_project" "project" {
  name            = var.project_name
  project_id      = var.project_id
  folder_id       = var.folder_id
  billing_account = var.billing_account
  skip_delete     = true
  labels = {
    "app" = "hera",
    "env" = "development"
  }
  auto_create_network = false
}

resource "google_project_service" "service" {
  for_each = toset([
    "artifactregistry.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudfunctions.googleapis.com",
    "cloudresourcemanager.googleapis.com",
  ])
  project = google_project.project.project_id
  service = each.key

  disable_dependent_services = false
  disable_on_destroy         = true
}

resource "google_project_iam_member" "cloudbuild" {
  for_each = toset([
    # "roles/appengine.appAdmin",
    "roles/cloudfunctions.developer",
    # "roles/cloudbuild.builds.builder",
    "roles/iam.serviceAccountUser",
  ])
  project = google_project_service.service["cloudbuild.googleapis.com"].project
  role    = each.key
  member  = "serviceAccount:${google_project.project.number}@cloudbuild.gserviceaccount.com"

}
