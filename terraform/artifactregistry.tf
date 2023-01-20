resource "google_artifact_registry_repository" "docker" {
  location      = var.region
  repository_id = "docker"
  description   = "Hera Docker Repository"
  format        = "DOCKER"
}

resource "google_artifact_registry_repository" "python" {
  location      = var.region
  repository_id = "python"
  description   = "Hera Python Repository"
  format        = "PYTHON"
}
