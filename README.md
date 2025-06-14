# DevOps Automation Project – Jenkins, Terraform, Ansible & Azure

This project demonstrates a full DevOps CI/CD pipeline that automatically provisions infrastructure on **Microsoft Azure**, configures it using **Ansible**, and orchestrates the flow using **Jenkins**, all within a **Dockerized environment on Windows**.

---------------------------------------------------------------------------------------------

## Project Overview

- **Provision** a Linux Virtual Machine on Azure using **Terraform**
- **Configure** the VM with **Apache Web Server** using **Ansible**
- **Automate** everything via a **Jenkins pipeline**
- Jenkins runs in a **Docker container** on **Windows**
- Final verification via `curl` to confirm server is running

---------------------------------------------------------------------------------------------

## Tech Stack

| Tool       | Purpose                                 |
|------------|------------------------------------------|
| Jenkins    | CI/CD Pipeline                           |
| Terraform  | Infrastructure as Code (IaC)             |
| Ansible    | Configuration Management                 |
| Azure CLI  | Cloud provisioning                       |
| Docker     | Containerized Jenkins environment        |
| Git        | Version Control                          |

---------------------------------------------------------------------------------------------

## Folder Structure

devops-project/
├── Jenkinsfile
├── terraform/
│ ├── main.tf
│ ├── variables.tf
│ └── id_rsa.pub
├── ansible/
│ └── install_web.yml
├── inventory # Auto-generated

---------------------------------------------------------------------------------------------

## Pipeline Stages (Defined in Jenkinsfile)

1. **Terraform Init** – Initializes Terraform in the `/terraform` directory.
2. **Terraform Apply** – Applies the infrastructure changes and provisions the VM.
3. **Get IP** – Extracts the public IP of the created VM and writes it into an Ansible inventory file.
4. **Run Ansible** – Uses SSH to connect and configure the server (Apache, HTML page).
5. **Verify** – Runs `curl` on the public IP to ensure web server is up.

---

## Setup Instructions

View "DevOps Project.docx" file.