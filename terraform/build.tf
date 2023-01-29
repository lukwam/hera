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

resource "google_cloudbuild_trigger" "deploy_hello_world_function" {
  provider           = google
  name               = "deploy-hello-world-function"
  description        = "Deploy hello_world Function"
  filename           = "functions/hello_world/cloudbuild.yaml"
  project            = google_project_service.service["cloudbuild.googleapis.com"].project
  include_build_logs = "INCLUDE_BUILD_LOGS_WITH_STATUS"

  included_files = [
    "functions/hello_world/**",
  ]
  ignored_files = [
    "functions/hello_world/*.md",
    "functions/hello_world/*.sh",
    "functions/hello_world/Dockerfile",
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

resource "google_cloudbuild_trigger" "deploy_hello_world_v2_function" {
  provider           = google
  name               = "deploy-hello-world-v2-function"
  description        = "Deploy hello_world_v2 Function"
  filename           = "functions/hello_world_v2/cloudbuild.yaml"
  project            = google_project_service.service["cloudbuild.googleapis.com"].project
  include_build_logs = "INCLUDE_BUILD_LOGS_WITH_STATUS"

  included_files = [
    "functions/hello_world_v2/**",
  ]
  ignored_files = [
    "functions/hello_world_v2/*.md",
    "functions/hello_world_v2/*.sh",
    "functions/hello_world_v2/Dockerfile",
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
