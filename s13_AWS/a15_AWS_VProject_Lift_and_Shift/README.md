#

## Create EC2


```sh
git clone https://github.com/hkhcoder/vprofile-project.git
```

## SSH in DB server for the checking

```sh

```

## Check the MySQL server

```sh
sudo systemctl status mariadb
```

## Login into the DB

```sh
sudo mysql -u admin -padmin123 accouts

> show tables;
> show exit;
```

## SSH in Memcache server for the checking

```sh
sudo -i
```

## Check the Memcache server

```sh
sudo systemctl status memcached
exit
```

## SSH in Rabbit MQ server for the checking

```sh
sudo -i
```

## Check the RabbitMQ server

```sh
sudo systemctl status rabbitmq-server
exit
```

## Install Java, Maven

```powershell
winget --version
winget install EclipseAdoptium.Temurin.17.JDK
winget install Apache.Maven
java -version
mvn -version
```

> Then set:

```txt
JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-17...
MAVEN_HOME=C:\Program Files\Apache\Maven

%JAVA_HOME%\bin
%MAVEN_HOME%\bin
``
```

## Build the artifact

```sh
$ mvn -version
Apache Maven 3.10.0 (c43a36b8d67be7e0805a411bc0898af1a51f5472)
Maven home: C:\tools\apache-maven
Java version: 17.0.20.1, vendor: Eclipse Adoptium, runtime: C:\Program Files\Eclipse Adoptium\jdk-17.0.20.101-hotspot
Default locale: en_US, platform encoding: Cp1252, time zone: America/New_York
OS name: "windows 11", version: "10.0", arch: "amd64", family: "windows"


```

## 

```sh

```

## 

```sh

```

## 

```sh

```

## 

```sh

```







