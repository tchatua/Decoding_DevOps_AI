# Security Groups


```sh
├── # Create Security Groups
│   └── Navigate to the EC2 Dashboard in the AWS Management Console
│       ├── Security Groups
│       ├── Create security group # 1 vprofile-ELB-SG
│       │   ├── Security Group Name: vprofile-ELB-SG
│       │   ├── Description: Security group for the vprofile load balancer
│       │   ├── Inbound rule > Add rule
│       │   │   ├── Type: HTTP
│       │   │   ├── Source: 0.0.0.0/0
│       │   │   ├── Type: HTTP
│       │   │   ├── Source: ::/0
│       │   │   ├── Type: HTTPS
│       │   │   ├── Source: 0.0.0.0/0
│       │   │   ├── Type: HTTPS
│       │   │   └── Source: ::/0
│       │   └── Create security group
│       ├── Create security group # 2 vprofile-app-sg
│       │   ├── Security Group Name: vprofile-app-sg
│       │   ├── Description: Security group for the Tomcat application server
│       │   ├── Inbound rule > Add rule
│       │   │   ├── Type: Custom TCP
│       │   │   ├── Port Range: 8080
│       │   │   ├── Source: vprofile-ELB-SG
│       │   │   ├── Description: Allow traffic from vprofile load balancer
│       │   │   ├── Type: SSH
│       │   │   └── Source: My IP
│       │   └── Create security group
│       ├── Create security group # 3 vprofile-backend-SG
│       │   ├── Security Group Name: vprofile-backend-SG
│       │   ├── Description: Security group for mysql, memcached, rabbitmq allowed from Tomcat app server
│       │   ├── Inbound rule > Add rule
│       │   │   ├── Add rule for MySQL
│       │   │   │   ├── Type: MySQL/Aurora
│       │   │   │   ├── Port Range: 3306
│       │   │   │   ├── Source: vprofile-app-sg
│       │   │   ├── Add rule for Memcached
│       │   │   │   ├── Type: Custom TCP
│       │   │   │   ├── Port Range: 11211
│       │   │   │   ├── Source: vprofile-app-sg
│       │   │   ├── Add rule for RabbitMQ
│       │   │   │   ├── Type: Custom TCP
│       │   │   │   ├── Port Range: 5672
│       │   │   │   ├── Source: vprofile-app-sg
│       │   │   ├── Add rule for ssh FROM mY ip
│       │   │   │   ├── Type: SSH
│       │   │   │   ├── Port Range: 22
│       │   │   │   ├── Source: My IP
│       │   └── Create security group
│       └── Add one more rule in the inbound rules of the vprofile-backend-SG # 3 vprofile-backend-SG
│           └── Edit inbound rules
│               └── Add rule  
│                   ├── Type: All trafic
│                   └── Source: vprofile-backend-SG

```