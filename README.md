🚀 GCP Apache Web Server with Load Balancer using Terraform

This project sets up a scalable and highly available Apache web server infrastructure on Google Cloud Platform using Terraform. It includes:

Instance Template with a Startup Script

Managed Instance Group (MIG)

Global HTTP Load Balancer

Firewall rules

Modular and clean Terraform code

📁 File Structure
.
├── firewall.tf         # Firewall rule to allow HTTP traffic
├── lb.tf               # Load balancer setup (backend service, URL map, proxy, forwarding rule)
├── mig.tf              # Managed Instance Group using the instance template
├── template.tf         # Instance Template with embedded startup script
├── outputs.tf          # Output variables (like LB IP)
├── providers.tf        # GCP provider definition
├── variables.tf        # Input variables like project_id, region, zone
├── .gitignore          # Ignore .terraform/ and terraform.tfstate*
└── README.md           # Documentation

🧰 What It Does

Creates an Instance Template (template.tf) that:

Installs Apache

Sets up a custom HTML page

Launches a Managed Instance Group (mig.tf) with auto-healing & health checks

Sets up a Global HTTP Load Balancer (lb.tf)

Opens port 80 using a Firewall Rule (firewall.tf)

Outputs the Load Balancer IP
