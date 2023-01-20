provider "google" {
  project = var.project_id
  region  = var.region
}

variable "billing_account" {}
variable "folder_id" {}
variable "project_id" {}
variable "project_name" {}
variable "region" {}
