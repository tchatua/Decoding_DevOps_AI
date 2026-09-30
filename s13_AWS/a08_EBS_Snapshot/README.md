# EBS Snapshots

Snapshots are backups of EBS volume

## Prerequisites

- EC2 Web01

Check my VM to see the extras volume

![alt text](images/image.png)

> Check the process using the directory

![alt text](images/image-1.png)

- Always kill running process before unmount the volume to free that directory

![alt text](images/image-2.png)

![alt text](images/image-3.png)

## Remove entry from /etc/fstab

![alt text](images/image-6.png)

![alt text](images/image-4.png)

![alt text](images/image-5.png)

- Now detached the volume

```sh
Go to Volumes and click on `Action` > `Detached volume`
└── Detach
```

- Delete this volume

```sh
Go to Volumes and click on `Action` > `Delete volume`
└── Delete
```

## Create a new volume for MySQL DB

```sh
Go to Volumes and click on `Create volume`
└── Volume settings
    ├── Volume size
    │   └── 5GB
    ├── Availability zone
    │   └── us-east-1c "same AZ as EC2"
    ├── Encryption (If requir)
    │   └── Check encrypt this volume "I can use the default key or create my own key using KMS service" (ignore it)
    ├── Tags - optional > `Add tag`
    │   ├── Key: Name
    │   └── Value: db-01-mysql-vol
    │    
    └── Create volume
```

## Attached vole to an EC2

```sh
Go to Volumes and click on `Action` > `Attached volume`
└── Basic detail
    ├── Instance: seach and select it
    ├── Device name: seach and select `/dev/sdh` (doesn't matter system will rename it as well)
    │    
    └── Attached volume
```

Go back to the EC2 instance and rename it as db01

> ssh to the instance:

![alt text](images/image-8.png)

> Create the partition

![alt text](images/image-9.png)

1. `n` to create a new partition
2. `p` for4 primary
3. `1` for partition number 1
4. press Enter for 1st sector
5. press Enter to go to the last sector
6. `w` to write

![alt text](images/image-10.png)

> Format the partition in xfs file

![alt text](images/image-11.png)

> Create and temporary mount the `/var/lib/mysql` folder for the mout volume

![alt text](images/image-12.png)


## Install the mariadb  server package

![alt text](images/image-13.png)

> start mariadb service

![alt text](images/image-14.png)

![alt text](images/image-15.png)

![alt text](images/image-16.png)

## Taking a snapshot

What happen if data lost 

I have to make a snapshot:
- The 1st snapshot will take all the data
- The following snapshots will tak only the incremental data

```sh
Go to Volumes and click on `Action` > select the require volume > `Create snapshot`
└── Snapshot details
    ├── Description: db01-mysql-snapshot
    ├── Tags
    │   └──  Add tag
    │       ├──  Key: Name
    │       └──  Value - optional: db01-mysql-snapshot
    │    
    └── Create snapshot
```

![alt text](images/image-17.png)

> Remove data (corrupted) from the volume and restart the mariadb service (we will have a error saying data is missing)
> Our snapshot volume is ready

![alt text](images/image-18.png)

> Deatch the volume

![alt text](images/image-19.png)

> rename this volume as corrupted

![alt text](images/image-20.png)

## Creating a new volume fom the snapshot

```sh
Go to Snapshots and click on `Action` > select the require volume > `Create volume from snapshot`
└── Volume settings
    ├── Volume type: db01-mysql-snapshot
    │   └── I can change volume type > 
    ├── Size
    │   └──  5Gb
    │   
    ├── Availability zone
    │   └──  I can also change the AZ based on my requiremet (keep a same zone here): us-east-1c
    │   
    ├── I can encrypot it
    │   
    ├── Tag
    │   └──  Add tag
    │       ├──  Key: Name
    │       └──  Value - optional: db01-mysql-vol-recovered
    │   
    └── Create snapshot
```

![alt text](images/image-21.png)

Now i can detached and delete the corrupted volume

![alt text](images/image-22.png)


> Now I can attached the recovered volume from the AWS Console

![alt text](images/image-23.png)

> L:ets mount it and check

![alt text](images/image-24.png)

![alt text](images/image-25.png)

![alt text](images/image-26.png)

![alt text](images/image-28.png)

![alt text](images/image-29.png)

- To move data from differenmts region is made by the snapshot


## Modify permission on the snapshot

```sh
Go to Snapshots and click on `Action` > select the require volume > `Snapshot settings` > `Modify permissions`
└── Modify permissions 
    ├── settings
    │   └── I can make a snapshot public
    └── Shared accounts
        └──  or I can share a snapshot with differents aws account
            └── Add account
                └── Account ID > Enter Account ID
                    └── Add > The snapshot shoul be available in the others aws account 
```


