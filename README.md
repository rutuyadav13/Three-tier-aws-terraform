# Three-tier-aws-terraform
🔹 Project Overview
This project demonstrates a fully automated three-tier architecture on AWS using Terraform.
It includes:
VPC with public and private subnets
Security Groups for ALB, EC2, and database
Frontend and Backend Auto Scaling Groups using Launch Templates
Application Load Balancers (ALB) for frontend & backend
RDS MySQL database for backend
Automatic deployment of frontend (Nginx) and backend (Apache + PHP) code from GitHub
Free Tier compatible using t3.micro instances.

🔹 Architecture Diagram

       Internet
          |
          v
    [Frontend ALB]
          |
          v
  [Frontend EC2 ASG]
          |
          v
    [Backend ALB]
          |
          v
  [Backend EC2 ASG]
          |
          v
      [RDS MySQL]
