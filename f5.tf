
resource "random_id" "id" {
  byte_length = 2
}


resource "google_service_account" "f5_service_account" {
  account_id  = "f5_service_account"
  description = "User for F5 BIGIP"
}
# Create random password for BIG-IP
#
module "bigip" {
  source          = "./modules"
  prefix          = format("%s-3nic", var.prefix)
  project_id      = var.project_id
  zone            = var.zone
  image           = var.image
  machine_type    = var.machine_type
  disk_type       = var.disk_type 
  min_cpu_platform =  var.min_cpu_platform
  disk_size_gb     = var.disk_size_gb
  sleep_time      = "1000s"
  f5_password     = var.f5_password
  f5_username     = "admin"
  service_account = google_service_account.f5_service_account.email
  mgmt_subnet_ids     = [{ "subnet_id" = google_compute_subnetwork.mgmt_subnetwork.id, "public_ip" = true, "private_ip_primary" = "10.0.1.5" }]
  external_subnet_ids = [{ "subnet_id" = google_compute_subnetwork.external_subnetwork.id, "public_ip" = false, "private_ip_primary" = "10.0.2.5", "private_ip_secondary" = "" }]
  internal_subnet_ids = [{ "subnet_id" = data.google_compute_subnetwork.shared_vpc.id, "public_ip" = false, "private_ip_primary" = "10.0.0.5", "private_ip_secondary" = "" }]
 }


# module "bigip-fo" {
#  source          = "./bigip"
#  prefix          = format("%s-3nic", var.prefix)
#  project_id      = var.project_id
#  zone            = var.zone2
#  image           = var.image
#  sleep_time      = "1000s"
#  f5_password     = var.f5_password
#  f5_username     = "admin"
#  service_account = google_service_account.f5_bigip_user.email
#  mgmt_subnet_ids     = [{ "subnet_id" = google_compute_subnetwork.mgmt_subnetwork.id, "public_ip" = true, "private_ip_primary" = "10.0.1.6" }]
#  external_subnet_ids = [{ "subnet_id" = google_compute_subnetwork.external_subnetwork.id, "public_ip" = false, "private_ip_primary" = "10.0.2.6", "private_ip_secondary" = "" }]
#  internal_subnet_ids = [{ "subnet_id" = data.google_compute_subnetwork.shared_vpc.id, "public_ip" = false, "private_ip_primary" = "10.0.0.6", "private_ip_secondary" = "" }]
# }



# module "bigip" {
#   count               = var.instance_count
#   source              = "../.."
#   prefix              = format("%s-3nic", var.prefix)
#   project_id          = var.project_id
#   zone                = var.zone
#   image               = var.image
#   service_account     = var.service_account
#   mgmt_subnet_ids     = [{ "subnet_id" = google_compute_subnetwork.mgmt_subnetwork.id, "public_ip" = true, "private_ip_primary" = "" }]
#   external_subnet_ids = [{ "subnet_id" = google_compute_subnetwork.external_subnetwork.id, "public_ip" = false, "private_ip_primary" = "", "private_ip_secondary" = "" }]
#   internal_subnet_ids = [{ "subnet_id" = google_compute_subnetwork.internal_subnetwork.id, "public_ip" = false, "private_ip_primary" = "", "private_ip_secondary" = "" }]
# }

