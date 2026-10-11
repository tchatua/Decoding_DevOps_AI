#!/bin/bash
DATABASE_PASS='admin123' # Creates a variable containing the MariaDB root password.
sudo dnf update -y  # Updates all packages to the latest version.
sudo dnf install git zip unzip -y  # Installs Git, Zip, and Unzip utilities.
sudo dnf install mariadb105-server -y  # Installs MariaDB server.
# starting & enabling mariadb-server
sudo systemctl start mariadb  # Starts the MariaDB service.
sudo systemctl enable mariadb  # Enables MariaDB to start on boot.
# Clone the application repository to /tmp directory.
cd /tmp/
git clone -b main https://github.com/hkhcoder/vprofile-project.git
#restore the dump file for the application
## Set the root password
sudo mysqladmin -u root password "$DATABASE_PASS"
## Ensure root uses the specified password
sudo mysql -u root -p"$DATABASE_PASS" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DATABASE_PASS'"
## Remove remote root accounts to prevents root login from remote machines.
sudo mysql -u root -p"$DATABASE_PASS" -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"
## Remove anonymous users
sudo mysql -u root -p"$DATABASE_PASS" -e "DELETE FROM mysql.user WHERE User=''"
## Remove test database and access to it
sudo mysql -u root -p"$DATABASE_PASS" -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'"
## Flush privileges to apply changes immediately
sudo mysql -u root -p"$DATABASE_PASS" -e "FLUSH PRIVILEGES"
## Create the application database and user with appropriate privileges
sudo mysql -u root -p"$DATABASE_PASS" -e "create database accounts"
sudo mysql -u root -p"$DATABASE_PASS" -e "grant all privileges on accounts.* TO 'admin'@'localhost' identified by 'admin123'"
sudo mysql -u root -p"$DATABASE_PASS" -e "grant all privileges on accounts.* TO 'admin'@'%' identified by 'admin123'"
## Restore the database backup
sudo mysql -u root -p"$DATABASE_PASS" accounts < /tmp/vprofile-project/src/main/resources/db_backup.sql
## Reload privileges again
sudo mysql -u root -p"$DATABASE_PASS" -e "FLUSH PRIVILEGES"
## End of MySQL setup script