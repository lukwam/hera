resource "google_cloudbuild_trigger" "build_docker_image" {
  provider           = google
  name               = "build-docker-image"
  description        = "Build Docker Image and push to Artifact Registry"
  filename           = "images/hera/cloudbuild.yaml"
  project            = google_project_service.service["cloudbuild.googleapis.com"].project
  include_build_logs = "INCLUDE_BUILD_LOGS_WITH_STATUS"

  included_files = [
    "images/hera/**",
  ]

  github {
    name  = "hera"
    owner = "lukwam"
    push {
      branch = "^main$"
    }
  }

  substitutions = {
    _REGION = var.region
  }

}

resource "google_cloudbuild_trigger" "build_python_package" {
  provider           = google
  name               = "build-python-package"
  description        = "Build Python Package and push to Artifact Repository"
  filename           = "package/cloudbuild.yaml"
  project            = google_project_service.service["cloudbuild.googleapis.com"].project
  include_build_logs = "INCLUDE_BUILD_LOGS_WITH_STATUS"

  included_files = [
    "package/setup.py",
  ]

  github {
    name  = "hera"
    owner = "lukwam"
    push {
      branch = "^main$"
    }
  }

  substitutions = {
    _REGION = var.region
  }

}
