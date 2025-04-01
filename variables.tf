variable "instance_count" {
  description = "Number of Bigip instances to create( From terraform 0.13, module supports count feature to spin mutliple instances )"
  type        = number
}
variable "prefix" {
  description = "Prefix for resources created by this module"
  type        = string
}
variable "project_id" {
  type        = string
  description = "The GCP project identifier where the cluster will be created."
}
variable "region" {
  type        = string
  description = "The compute region which will host the BIG-IP VMs"
}
variable "zone" {
  type        = string
  description = "The compute zones which will host the BIG-IP VMs"
}
variable "zone2" {
  type        = string
  description = "The compute zones which will host the BIG-IP VM-2"
}

variable "image" {
  type = string
  description = "The self-link URI for a BIG-IP image to use as a base for the VM cluster. This can be an official F5 image from GCP Marketplace, or a customised image."
}

variable "f5_service_account" {
  description = "F5 BigIP autoprovision service account email"
  type        = string
}
variable "f5_password" {
  description = "F5 devices Password" 
  type        = string
  sensitive = true
}

variable "machine_type" {
  description = "machine_type"
  type        = string
}
variable "disk_type" {
  description = "disk_type"
  type        = string
}
variable "disk_size_gb" {
  description = "disk_size_gb"
  type        = string
}
variable "min_cpu_platform" {
  description = "cpu_platform"
  type        = string
}
 
