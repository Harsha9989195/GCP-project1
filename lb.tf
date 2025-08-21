resource "google_compute_health_check" "http" {
  name                = "apache-hc"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2

  http_health_check {
    port = 80
  }
}

resource "google_compute_backend_service" "backend" {
  name          = "apache-backend"
  protocol      = "HTTP"
  port_name     = "http"
  health_checks = [google_compute_health_check.http.self_link]
  timeout_sec   = 10

  backend {
    group = google_compute_instance_group_manager.mig.instance_group
  }
}

resource "google_compute_url_map" "umap" {
  name            = "apache-url-map"
  default_service = google_compute_backend_service.backend.self_link
}

resource "google_compute_target_http_proxy" "proxy" {
  name    = "apache-http-proxy"
  url_map = google_compute_url_map.umap.self_link
}

resource "google_compute_global_address" "lb_ip" {
  name = "apache-lb-ip"
}

resource "google_compute_global_forwarding_rule" "http" {
  name       = "apache-http-fr"
  target     = google_compute_target_http_proxy.proxy.self_link
  port_range = "80"
  ip_address = google_compute_global_address.lb_ip.address
}

