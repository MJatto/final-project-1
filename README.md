# Cloud-Native Java Platform on AWS

A production-style Java Spring Boot application deployed on Amazon EKS using Terraform, Docker, Jenkins, and Kubernetes.

This project demonstrates an end-to-end DevOps workflow, from infrastructure provisioning to automated application deployment.

---

# Architecture

```text
Developer
     │
     ▼
 GitHub Repository
     │
     ▼
 Jenkins CI/CD
     │
     ▼
 Docker Build
     │
     ▼
 Container Image
     │
     ▼
 Amazon EKS
     │
     ▼
 Kubernetes Service
     │
     ▼
 AWS Load Balancer
     │
     ▼
 Users
```

---

# Features

- Java Spring Boot REST API
- Docker containerization
- Jenkins CI/CD pipeline
- Infrastructure as Code using Terraform
- Amazon EKS deployment
- Kubernetes manifests
- ConfigMaps
- Ingress Controller
- Production-style infrastructure

---

# Technologies

- Java
- Spring Boot
- Maven
- Docker
- Kubernetes
- Terraform
- Jenkins
- AWS EKS
- AWS VPC

---

# Repository Structure

```
app/
Dockerfile
Jenkinsfile
k8s/
terraform/
```

---

# Infrastructure

Terraform provisions:

- VPC
- Subnets
- Internet Gateway
- EKS Cluster
- Node Groups
- IAM Roles

---

# Kubernetes

The application is deployed using:

- Deployment
- Service
- Ingress
- ConfigMap

---

# CI/CD Pipeline

1. Developer pushes code
2. Jenkins builds Maven project
3. Docker image created
4. Image pushed to registry
5. Kubernetes deployment updated
6. Application becomes available on EKS

---

# Future Improvements

- GitHub Actions pipeline
- Helm charts
- ArgoCD
- Horizontal Pod Autoscaler
- Prometheus
- Grafana
- ELK Stack
- HTTPS with ACM

---

# Lessons Learned

This project strengthened my understanding of:

- Infrastructure as Code
- Kubernetes deployments
- CI/CD automation
- Cloud networking
- Container orchestration
