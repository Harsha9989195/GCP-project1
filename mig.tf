resource "google_compute_instance_group_manager" "mig" {
  name               = "apache-mig"
  base_instance_name = "apache"
  zone               = var.zone

  version {
    instance_template = google_compute_instance_template.apache_template.self_link
  }

  target_size = 2
}

