# EC2 instances

```sh
│  git clone https://github.com/tchatua/vprofile-project.git  
│    
├── # 1/4 Create EC2 Instances for MySQL
│   └── EC2 # Instructions for setting up an EC2 instance to connect to the RDS database
│       └── Instances 
│           ├── Launch instance
│           ├── Name and tags
│           │   ├── Key: Name
│           │   ├── Value: vprofile-db01
│           │   ├── Resource types: Instances, volumes
│           │   │   ├── Instances
│           │   │   └── Volumes
│           │   └── Add tags
│           │       ├── Key: Project
│           │       └── Value: vprofile
│           ├── Application and OS Images (Amazon Machine Image)  
│           │   └── Choose Amazon Linux AWS
│           │       └── Amazon Linux 2023 > Free tier eligible
│           ├── Instance type  
│           │   └── t2.micro
│           ├── key pair (login)
│           │  ├──  Key pair name > vprofile-prod-key
│           │  ├──  Key pair type > RSA
│           │  ├──  Private key file format > .pem
│           │  └──  Create key pair
│           ├── Network settings > Edit
│           │   ├── VPC > Default vpc
│           │   ├── Auto assign public ip > Enable
│           │   └── Firewall (Security group) > Select existing security group
│           │   │   └── Common security group name > vprofile-backend-sg
│           │   └── Launch instance
│           └── Advanced details
│               ├── User data
│               ├── paste here mysql.sh script
│               └── Launch instance
├── # 2/4 Create EC2 Instances for Memcached
│   └── EC2 # Instructions for setting up an EC2 instance to connect to the RDS database
│       └── Instances 
│           ├── Launch instance
│           ├── Name and tags
│           │   ├── Key: Name
│           │   ├── Value: vprofile-mc01
│           │   ├── Resource types: Instances, volumes
│           │   │   ├── Instances
│           │   │   └── Volumes
│           │   └── Add tags
│           │       ├── Key: Project
│           │       └── Value: vprofile
│           ├── Application and OS Images (Amazon Machine Image)  
│           │   └── Choose Amazon Linux AWS
│           │       └── Amazon Linux 2023 > Free tier eligible
│           ├── Instance type  
│           │   └── t2.micro
│           ├── key pair (login)
│           │  └──  Key pair name > search and select `vprofile-prod-key`
│           ├── Network settings > Edit
│           │   ├── VPC > Default vpc
│           │   ├── Auto assign public ip > Enable
│           │   └── Firewall (Security group) > Select existing security group
│           │   │   └── Common security group name > vprofile-backend-sg
│           │   └── Launch instance
│           └── Advanced details
│               ├── User data
│               ├── paste here memcache.sh script
│               └── Launch instance
├── # 3/4 Create EC2 Instances for RabbitMQ
│   └── EC2 # Instructions for setting up an EC2 instance to connect to the RDS database
│       └── Instances 
│           ├── Launch instance
│           ├── Name and tags
│           │   ├── Key: Name
│           │   ├── Value: vprofile-rmq01
│           │   ├── Resource types: Instances, volumes
│           │   │   ├── Instances
│           │   │   └── Volumes
│           │   └── Add tags
│           │       ├── Key: Project
│           │       ├── Value: vprofile
│           │       └── Resource types: Instances, volumes
│           │           ├── Instances
│           │           └── Volumes
│           ├── Application and OS Images (Amazon Machine Image)  
│           │   └── Choose Amazon Linux AWS
│           │       └── Amazon Linux 2023 > Free tier eligible
│           ├── Instance type  
│           │   └── t2.micro
│           ├── key pair (login)
│           │  └──  Key pair name > search and select `vprofile-prod-key`
│           ├── Network settings > Edit
│           │   ├── VPC > Default vpc
│           │   ├── Auto assign public ip > Enable
│           │   └── Firewall (Security group) > Select existing security group
│           │   │   └── Common security group name > vprofile-backend-sg
│           │   └── Launch instance
│           └── Advanced details
│               ├── User data
│               ├── paste here rabbitmq.sh script
│               └── Launch instance
├── # 4/4 Create EC2 Instances for Tomcat
│   └── EC2 # Instructions for setting up an EC2 instance to connect to the RDS database
│       └── Instances 
│           ├── Launch instance
│           ├── Name and tags
│           │   ├── Key: Name
│           │   ├── Value: vprofile-app01
│           │   ├── Resource types: Instances, volumes
│           │   │   ├── Instances
│           │   │   └── Volumes
│           │   └── Add tags
│           │       ├── Key: Project
│           │       ├── Value: vprofile
│           │       └── Resource types: Instances, volumes
│           │           ├── Instances
│           │           └── Volumes
│           ├── Application and OS Images (Ubuntu)  
│           │   └── Choose Ubuntu
│           │       └── Ubuntu 24.04 LTS > Free tier eligible
│           ├── Instance type  
│           │   └── t2.micro
│           ├── key pair (login)
│           │  └──  Key pair name > search and select `vprofile-prod-key`
│           ├── Network settings > Edit
│           │   ├── VPC > Default vpc
│           │   ├── Auto assign public ip > Enable
│           │   └── Firewall (Security group) > Select existing security group
│           │   │   └── Common security group name > vprofile- app-sg
│           │   └── Launch instance
│           └── Advanced details
│               ├── User data
│               ├── paste here tomcat_ubuntu.sh script
│               └── Launch instance

```

