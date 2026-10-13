# 🛡️ AWS Production Multi-AZ VPC Architecture with Terraform (IaC)

![Terraform](https://img.shields.io/badge/Terraform-1.5+-623CE4?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-VPC%20%7C%20EC2%20%7C%20NAT-FF9900?logo=amazon-aws)
![Security](https://img.shields.io/badge/Security-Chained_Security_Groups-success)
![Status](https://img.shields.io/badge/Deployment-Automated-brightgreen)

This repository provisions an enterprise-grade, secure, multi-availability zone AWS Virtual Private Cloud (VPC) using **Infrastructure as Code (IaC) via Terraform**.

---

## 🏗️ Architecture Design

```text
                               AWS VPC (10.0.0.0/16)
 ┌─────────────────────────────────────────────────────────────────────────────┐
 │                                                                             │
 │   Internet Gateway (IGW) <───> Internet (0.0.0.0/0)                         │
 │          ▲                                                                  │
 │   ┌──────┴───────────────────────────┐ ┌────────────────────────────────┐   │
 │   │ Public Subnet 1 (us-east-1a)     │ │ Public Subnet 2 (us-east-1b)   │   │
 │   │  • Bastion Jump Host (Public IP) │ │  • Spare Public Subnet         │   │
 │   │  • Managed NAT Gateway           │ │                                │   │
 │   └──────┬───────────────────────────┘ └────────────────────────────────┘   │
 │          │ (Outbound Traffic only via NAT Gateway)                          │
 │          ▼                                                                  │
 │   ┌──────────────────────────────────┐ ┌────────────────────────────────┐   │
 │   │ Private Subnet 1 (us-east-1a)    │ │ Private Subnet 2 (us-east-1b)  │   │
 │   │  • Private Workload EC2          │ │  • Private DB / Backend Subnet │   │
 │   │  • (Port 22 SSH only from Bastion)│ │                                │   │
 │   └──────────────────────────────────┘ └────────────────────────────────┘   │
 └─────────────────────────────────────────────────────────────────────────────┘