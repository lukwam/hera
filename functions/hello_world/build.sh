#!/bin/bash

FUNCTION="hello_world"
PROJECT="${PROJECT:="lukwam-hera-hera"}"
REGION="${REGION:="us-central1"}"
IMAGE="${REGION}.python.pkg.dev/${PROJECT_ID}/docker/${FUNCTION}"

../../scripts/prepreqs.sh

docker build -t "${FUNCTION}" .
# pack build "${FUNCTION}" --builder gcr.io/buildpacks/builder
# gcloud builds submit --project "${PROJECT}" --tag "${IMAGE}"
