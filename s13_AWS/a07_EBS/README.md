# Elastic Bloc Storage

![alt text](image.png)

![alt text](image-1.png)

## Launch an EC2 instance (CentOSS)

```
Create an EC2 Instanmce from AWS GUI
└── Search and choose EC2
    └── Launch Instance
    │   ├── Choose a region 
    │   ├── Name and Tags
    │   │    └── Name: Server1
    │   │ 
    │   ├── Application and OS Images (AMI)
    │   │    ├── Choose the AMI as Am,azon Linux 2023 AMI - Free Tier
    │   │    └── Choose Instance Type: t2.micro
    │   │    
    │   ├── Key Pair: select an existing one
    │   │    
    │   ├── Network Settings
    │   │    └── Security Group: selecting an existing one
    │   │    
    │   └── Advanced details
    │       ├── Configure storage
    │       │   ├── By default: 8GB size volume and gp3 type volume
    │       │   ├── Based on the requirement I can modify it
    │       │   └── I'll keep default configuration for now
    │       │    
    │       └── User data
    │   
    └── Launch Instance      
```

> User data

```sh
#!/bin/bash
yum install httpd wget unzip -y
systemctl start httpd
systemctl enable httpd
cd /tmp
wget https://www.tooplate.com/zip-templates/2119_gymso_fitness.zip
unzip -o 2119_gymso_fitness.zip
cp -r 2119_gymso_fitness/* /var/www/html/
systemctl restart httpd
```

![alt text](image-2.png)

![alt text](image-3.png)

![alt text](image-4.png)

![alt text](image-5.png)

## To list all the available and connected hard disc

![alt text](image-6.png)

![alt text](image-7.png)

## Adding extras volume to store webserver data

![alt text](image-8.png)

```sh
Go to Volumes and click on `Create volume`
└── Volume settings
    ├── Volume size
    │   └── 5GB
    ├── Availability zone
    │   └── us-east-1c "same AZ as EC2"
    ├── Encryption (If requir)
    │   └── Check encrypt this volume "I can use the default key or create my own key using KMS service" (ignore it)
    ├── Tags 
    │   ├── Key: Name
    │   └── Value: agt-web01-dev-images
    │    
    └── Create volume
```

![alt text](image-9.png)

## Attached vole to an EC2

```
Go to Volumes and click on `Action` > `Attached volume`
└── Basic detail
    ├── Instance: seach and select it
    ├── Device name: seach and select `/dev/sdf` (doesn't matter system will rename it as well)
    │    
    └── Attached volume
```

![alt text](image-10.png)

## Creating a partition from the new /dev/xvdf

![alt text](image-12.png)

![alt text](image-11.png)

![alt text](image-13.png)

![alt text](image-14.png)

![alt text](image-15.png)

- Hit enter to use the entire disk partition
![alt text](image-16.png)

- Hit p to print
![alt text](image-17.png)

![alt text](image-18.png)

## Formatting the created partition

![alt text](image-19.png)

- Backup files in another directory first
![alt text](image-20.png)

![alt text](image-21.png)

![alt text](image-22.png)

![alt text](image-23.png)

![alt text](image-24.png)

![alt text](image-25.png)

## To unmount the partition

![alt text](image-26.png)

## The permanent mount

![alt text](image-27.png)

![alt text](image-28.png)

![alt text](image-29.png)












