# Three-tier-aws-terraform
## 🔹 Project Overview

This repository contains a **fully automated three-tier architecture on AWS** built with **Terraform**.

It automates the provisioning of:  

- 🌐 **VPC** with public and private subnets  
- 🔒 **Security Groups** for ALB, EC2, and RDS  
- ⚡ **Frontend & Backend Auto Scaling Groups** with Launch Templates  
- 🖥️ **Application Load Balancers (ALB)** for traffic distribution  
- 💾 **RDS MySQL database** for backend  
- 🚀 **Automatic deployment** of frontend (Nginx) and backend (Apache + PHP) from GitHub  

**Free Tier compatible:** `t3.micro` instances 

## 🔹 Architecture Diagram





---

## 🔹 Features

- ✅ Infrastructure as code using **Terraform**  
- ✅ **High availability** with Auto Scaling Groups  
- ✅ **ALB Health Checks** for frontend & backend  
- ✅ Automated EC2 provisioning via **user-data scripts**  
- ✅ **Secure architecture** with properly configured Security Groups  
- ✅ Free Tier compatible (`t3.micro`)  

---

## 🔹 Prerequisites

- AWS account with Free Tier enabled  
- Terraform v1.5+ installed  
- AWS CLI configured  
- SSH key pair in the AWS region  

---

## 🔹 Deployment Instructions

1. **Clone the repository**

```bash
git clone https://github.com/rutuyadav13/Three-tier-aws-terraform.git
cd Three-tier-aws-terraform

2.  Configure variables
Update variables.tf for:
vpc_cidr
rds_endpoint

3.Initialize Terraform
terraform init

4. Plan
terraform plan

5. Apply
terraform apply

Confirm with yes
Wait 5–10 minutes for EC2, ALB, ASG, and RDS to be ready

6. Access Frontend
Open the Frontend ALB DNS from Terraform outputs in your browser:
http://<frontend-alb-dns>
```

---

## 🔹 Troubleshooting

| Issue                      | Solution                                                                       |
| ------------------------   | ------------------------------------------------------------------------------ |
| ❌ ERR_CONNECTION_REFUSED  | Check EC2 instances are running Nginx/Apache; review `/var/log/user-data.log`  |
| ❌ ERR_TIMED_OUT           | Ensure ALB is public, subnets route to Internet Gateway, and SGs allow traffic |
| ❌ Target group unhealthy  | Confirm web server responds on port 80                                         |

