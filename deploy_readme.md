== Deployment with Capistrano

Step 1: Setup Server and Secure it.

* Login using SSH
  ```ssh root@123.45.67.890
* Change the root password
  ```passwd```
* Disable root login and also disbale login with password
* Create admin group
  ```/usr/sbin/groupadd wheel```
* Give this group sudo priviledges
  ```/usr/sbin/visudo``` 
  scroll down to bottom of the file and add the following lines
  ```##Allow people in this group to run all commands
     %wheel ALL=(ALL) ALL```
* Create new 'app' user
  * /usr/sbin/adduser app
* Add user to admin group
  * /usr/sbin/usermod -a -G wheel app
* Set up the ssh keys on local machine using ssh-keygen 
  create .ssh directory
  ```mkdir ~/.ssh```
  to create ssh key on you local machine enter
  ```ssh-keygen -t rsa```
* Copy the public key file on server
  ```scp ~/.ssh/id_rsa.pub app@123.45.67.890:```
  when prompted enter your password
* Create .ssh folder in home directory
* Upload public key to ~/.ssh/authorized_keys 
* SSH permissions
* iptables
* reload sshd
* Now open other terminal and login using created user

Step 2: Installl Web server, Database server and other softwares as root

  * Update the system
    ```sudo apt-get update```
    ```sudo apt-get upgrade```
  * Install web server - Apache/Nginx
    ```sudo apt-get install apache```
  * Install database server - MySQL
    ```sudo apt-get install mysql-server```
  * Install essential packages needed for ruby, rails and other gems
    like mysql2
    ```sudo apt-get install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion libmysql-ruby libmysqlclient-dev```
  * Install rbenv and ruby-build
    https://github.com/sstephenson/rbenv
    https://github.com/sstephenson/ruby-build
  * Install rubies in ```/opt``` directory using ruby-build
  * symlink to ~/.rbenv/versions to /opt directory

Step 3: Getting read for deployment using Capistrano

  * capistrano and database.yaml file 
    http://www.simonecarletti.com/blog/2009/06/capistrano-and-database-yml/
  * require "bundler/capistrano"

Upload the code using the cap tasks
After that run the bundle install --binstubs
Than bundle install --deployment

Key Points:

* disable the root and password access
* all apps are deployed with ```app``` user
* ssh access for app user
* all rubies in /opt
* rbenv and ruby-build
* bundler to manage gems
* capistrano for deployment


Steps to follow on local:

* bundle install --binstubs
* create database on remote
* cap task to bundle install --deloyment
