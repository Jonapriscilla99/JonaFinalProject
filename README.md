# JonaFinalProject

Tasks in Hand:
1. Create a Terraform code for Security Group and EC2 Instance
2. Use Ansible for configuring EC2 (Install Nginx or Apache)
3. Create a GitHub Repository
4. Prepare an index.html file
5. Create a CI/CD Pipeline (Using GitHub Actions or Jenkins), that will upload the index.html file on EC2 Instance from the Repository.
   
Task 1: A Terraform code to create EC2 Instance with a Security Group.

Pre-requisite:

-Terraform
-VS Code
-AWSCLI

--> AWS Acoount to work on 

--> A Terraform code file (refer main.tf file) to connect to the AWS cloud using 'provider block' and to create an ec2 instance.
       * Using the provider block, mention the region name
       * Provider "aws" { region = "eu-central-1" } 
       * Using the resource block, mentioning the information to create an instance.
       *Below are the Given Information
            -- Instance name
            -- Operating system (AMI)
            -- Instance Type
            -- Keypair
            -- VPC
            
Use the documentation https://registry.terraform.io/providers/hashicorp/aws/latest

Task 2: Use Ansible for configuring EC2 (Install Nginx or Apache)

Pre-requisite

       * Set Up and connect to the  EC2 Instance that was created using Terraform code
       * Install Ansible using the commands in  https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-22-04
       * Verify that Ansible is installed with ansible --version
       * Create an Ansible playbook (refer nginx.yml) to install Nginx.
       * Run Ansible Playbook -- sudo ansible-playbook nginx.yml (command)
       * Verify Nginx Installation with your public ip [http://3.120.149.155](http://3.71.199.214/)

Task 3 and 4: Creating a GitHub Repository

Pre-requisite

       * GitHub Account
Steps:

       * Create New Repository give Repository name of your own
       * Inside Repository Upload or Create new Index.html file
       * Commit changes to save the file.
       
Task 5: Create a CI/CD Pipeline (Using Jenkins) to transfer .html file from Repository to EC2 Instance

Pre-requisite

      * Install jenkins and docker to your EC2 instance below links
          https://www.jenkins.io/doc/book/installing/docker/#setup-wizard
          https://docs.docker.com/engine/install/ubuntu/#uninstall-docker-engine
Steps:

      * After Installation check the jenkins using your public ip ([eg: http://35.159.17.214:8080/](http://3.71.199.214:8080/)) 
      * Install all the necessary plugins.
      
         --> dashboard-> Manage Jenkins->System -> make the changes under "Publish over SSH" -> 
             update your key and SSH Servers settings dashboard -> create a new job -> go to configurations -> add your github project url -> select Git under source 
             code management and give git repository url -> check "GitHub hook trigger for GITScm polling" under build triggers -> check "Send files or execute 
             commands over SSH after the build runs" under build environment -> give name for the server -> add the source file set (eg: **/*.html) 
        --> give the remote directry (eg:/) -> apply and save
        
      * Give permission for the users in html directory
      
      * Build the project (using BUILD now) and check if index.html file is moved inside the EC2 instance and verify it using your publicIP

Below are the few Documentation links to refer to.

digitalocean.comdigitalocean.com
How To Install and Configure Ansible on Ubuntu 22.04  | DigitalOcean
Configuration management systems are designed to streamline the process of controlling large numbers of servers, for administrators and operations teams. The…
jenkins.iojenkins.io
Docker
Jenkins – an open source automation server which enables developers around the world to reliably build, test, and deploy their software (35 kB)
https://www.jenkins.io/doc/book/installing/docker/#setup-wizard

Docker DocumentationDocker Documentation
Install Docker Engine on Ubuntu
Jumpstart your client-side server applications with Docker Engine on Ubuntu. This guide details prerequisites and multiple methods to install.
Aug 23rd (28 kB)
