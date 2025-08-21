resource "google_compute_instance_template" "apache_template" {
  name         = "apache-template"
  machine_type = "e2-micro"
  tags         = ["web"]

  disk {
    source_image = "debian-cloud/debian-11"
    auto_delete  = true
    boot         = true
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y apache2
    echo "Welcome to Apache on MIG via Terraform!" > /var/www/html/index.html
    systemctl enable apache2
    systemctl start apache2
  EOF

  network_interface {
    network = "default"
    access_config {}
  }
}

