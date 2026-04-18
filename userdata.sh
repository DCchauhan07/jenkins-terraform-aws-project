#!/bin/bash

apt update -y
apt install -y nginx
systemctl start nginx
systemctl enable nginx
echo "<h1> Terraform provisioned EC2 via Jenkins</h1>" > /var/www/html/index.html
