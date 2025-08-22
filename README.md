# ☁️ GCP Terraform Project – Managed Instance Group (MIG) with Apache & Load Balancer

This project provisions a complete infrastructure setup on **Google Cloud Platform (GCP)** using **Terraform**. It deploys a **Managed Instance Group (MIG)** of virtual machines running **Apache Web Server**, with traffic routed through a **Global HTTP Load Balancer**.

🔥 Access your app using just the **Load Balancer IP** — fully automated, production-grade, and cost-efficient!

---

## 🎯 Objective

- ✅ Launch multiple VM instances using **Managed Instance Group**
- ✅ Auto-install **Apache HTTP Server** using startup scripts
- ✅ Configure **Global Load Balancer** for traffic distribution
- ✅ Allow **HTTP ingress (port 80)** via firewall
- ✅ Access the webpage using **external Load Balancer IP**

---

## 🧱 Tech Stack

- **Terraform** for Infrastructure as Code (IaC)
- **Google Cloud Platform (GCP)**
  - Compute Engine
  - Instance Template
  - Managed Instance Group
  - HTTP(S) Load Balancer
  - Firewall Rules
- **Apache Web Server** (via startup script)

---

## 📁 Folder Structure



GCP-project1/

├── provider.tf # GCP provider and auth config

├── variable.tf # Input variables

├── output.tf # Output Load Balancer IP

├── firewall.tf # Allow HTTP traffic

├── mig.tf # Managed Instance Group setup

├── template.tf # Instance Template with startup script

├── lb.tf # Load Balancer configuration

├── .gitignore # Ignore .Terraform 



---

## 🚀 Deployment in Cloud Shell (Free Tier Safe)

### ✅ Prerequisites
- GCP Project with billing enabled
- [Cloud Shell](https://shell.cloud.google.com/) or Terraform installed locally
- Enabled `compute.googleapis.com` API

### 🛠️ Set Project & Region (in Cloud Shell)

```bash
# Replace with your actual project ID
PROJECT_ID=your-project-id
REGION=us-central1
ZONE=us-central1-a

gcloud config set project $PROJECT_ID
gcloud config set compute/region $REGION
gcloud config set compute/zone $ZONE
gcloud services enable compute.googleapis.com 


📦 Clone & Deploy

git clone https://github.com/Harsha9989195/GCP-project1.git
cd GCP-project1

terraform init
terraform plan
terraform apply

🌐 Access Your Apache Website

Once deployed, Terraform will print your Load Balancer IP:

load_balancer_ip = http://<EXTERNAL_IP>


Visit it in your browser. You’ll see the Apache welcome page served by instances in the Managed Instance Group.


🧼 Clean Up

To avoid ongoing GCP costs:

terraform destroy
