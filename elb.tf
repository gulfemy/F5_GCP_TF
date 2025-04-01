#resource "google_compute_address" "app1-pip" {
#  name = "app1-publicip"
#  address_type = "EXTERNAL"
#  ip_version   = "IPV4"
#}
##health check
#resource "google_compute_region_health_check" "http" {
#  name               = "http-health-check"
#  timeout_sec        = 1
#  check_interval_sec = 1
#
#  tcp_health_check {
#    port = "80"
#  }
#}
#====================================================================
#instance_group and backend service
#resource "google_compute_region_instance_group" "backend_group" {
#  name   = "backend-instance-group"
#  instances = [
#    "module.bigip.google_compute_instance.f5vm01", # from module.bigip
#    "module.bigip-fo.google_compute_instance.f5vm01"  # from module.bigip-fo
#  ]
#
#  named_port {
#    name = "http"
#    port = 80
#  }
#}
#resource "google_compute_region_backend_service" "backend_service" {
#  name                  = "tcp-backend-service"
#  protocol              = "TCP"
#  load_balancing_scheme = "EXTERNAL"
#  health_checks         = [google_compute_region_health_check.http.self_link]
#  region = var.region
#  backend {
#    balancing_mode = "CONNECTION"
#    group = google_compute_region_instance_group.backend_group.self_link
#  }
#}
##====================================================================
## forwarding rule
#resource "google_compute_forwarding_rule" "tcp_forwarding_rule" {
#  name                  = "tcp-lb-forwarding-rule"
#  load_balancing_scheme = "EXTERNAL"
#  ip_protocol           = "TCP"
#  port_range           = "80"
#  backend_service      = google_compute_region_backend_service.backend_service.self_link
#  ip_address           = google_compute_address.app1-pip.address
#}
