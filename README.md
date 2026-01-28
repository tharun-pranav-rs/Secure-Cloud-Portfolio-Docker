# 🛡️ Secure Cloud Infrastructure & Portfolio

![Project Status](https://img.shields.io/badge/Status-Operational-success?style=for-the-badge)
![Security Clearance](https://img.shields.io/badge/Docker-Containerized-blue?style=for-the-badge&logo=docker)
![AWS](https://img.shields.io/badge/AWS-EC2-orange?style=for-the-badge&logo=amazon-aws)

## ✈️ The "Aeronautical" Approach to Cloud Security
> *"In aviation, safety isn't an option; it's the baseline. I apply the same zero-error tolerance from Aeronautical Engineering to Cloud Infrastructure."*

This project demonstrates a **secure-by-design** web server deployment on AWS. Unlike typical "Hello World" setups, this infrastructure adheres to **NIST SP 800-53** principles regarding Access Control (AC) and System Integrity (SI).

---

## 🏗️ Architecture Design
The system uses a **Defense-in-Depth** strategy, ensuring that even if one layer fails, the core asset remains protected.

```mermaid
graph LR
    User([User / Internet]) -- HTTPS/443 --> CF[Cloudflare WAF]
    style CF fill:#f96,stroke:#333,stroke-width:2px
    
    subgraph "AWS Cloud (Mumbai)"
        CF -- Proxied Traffic --> SG[Security Group / Firewall]
        style SG fill:#ff9,stroke:#333,stroke-width:2px
        
        SG -- Allow Port 80/443 --> EC2[EC2 Instance]
        style EC2 fill:#9f9,stroke:#333,stroke-width:2px
        
        subgraph "Docker Container"
            EC2 --> Docker[Port 8080:80]
            Docker --> Nginx[Nginx Alpine]
            Nginx --> HTML[Portfolio Site]
        end
    end
    
    %% Security Controls

🔒 Security Controls Implemented
1. Perimeter Defense
Least Privilege Firewalling: AWS Security Group denies all non-essential traffic.

SSH Hardening: SSH (Port 22) is restricted strictly to a Single Static IP (/32 CIDR).

2. System Integrity (Containerization)
Immutable Infrastructure: The application runs inside a Docker Container, ensuring the environment is identical across development and production.

Minimalist OS: Uses nginx:alpine (a 5MB Linux image) to drastically reduce the attack surface compared to a full OS.

🐳 How to Deploy (Docker)
Prerequisites
Docker Installed (sudo apt install docker.io)

1. Build the Image
Bash
# Build the container from the Dockerfile
docker build -t my-portfolio:v1 .
2. Run the Container
Bash
# Run in background, mapping Port 8080 to Container Port 80
docker run -d -p 8080:80 --name portfolio-container my-portfolio:v1
3. Verify Deployment
Bash
curl localhost:8080
# Output: Returns the secure HTML portfolio
👨‍💻 About Me
Tharun Pranav RS | Aeronautical Engineer | CompTIA Security+ Certified

Transitioning from Aeronautical Engineering to Cybersecurity, I build cloud systems with the same rigor used in flight safety protocols.

<img src="https://img.shields.io/badge/linkedin-%230077B5.svg?&style=for-the-badge&logo=linkedin&logoColor=white" />
    classDef security fill:#f00,color:white,stroke-width:2px;
    SSH[SSH Access] -- Port 22 (My IP Only) --> SG
    style SSH fill:#f9f,stroke:#333,stroke-width:4px
