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
  ])
  project = google_project.project.project_id
  service = each.key

  disable_dependent_services = false
  disable_on_destroy         = true
}
