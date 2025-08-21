resource "google_compute_firewall" "allow_http" {
  name    = "allow-http-and-hc"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  # health check source ranges + open web (demo)
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16", "0.0.0.0/0"]
  target_tags   = ["web"]
}
