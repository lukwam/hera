#!/bin/bash

ACCESS_TOKEN="$(gcloud auth print-access-token)"
REGION="${REGION:="us-central1"}"
REPO="${REPO:="python"}"
PROJECT="${PROJECT:="lukwam-hera"}"

sed -e "s/{{ACCESS_TOKEN}}/${ACCESS_TOKEN}/" \
    -e "s/{{PROJECT}}/${PROJECT}/" \
    -e "s/{{REGION}}/${REGION}/" \
    -e "s/{{REPO}}/${REPO}/" \
    requirements.txt.tmpl > requirements.txt

echo "Created requirements.txt from requirements.txt.tmpl"
