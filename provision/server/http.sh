#!/bin/bash
echo "Provisioning script $0"

echo "Install needed packages"
dnf -y groupinstall "Basic Web Server"
dnf -y install php

echo "Copy configuration files"
mkdir -p /etc/ssl/private
cp -R /vagrant/provision/server/http/etc/httpd/* /etc/httpd
cp -R /vagrant/provision/server/http/var/www/* /var/www
cp -R  /vagrant/provision/server/http/etc/ssl/private/* /etc/ssl/private/
chown -R apache:apache /var/www
restorecon -vR /etc
restorecon -vR /var/www

echo "Configure firewall"
firewall-cmd --add-service=http --permanent
firewall-cmd --add-service=https --permanent
firewall-cmd --reload

echo "Start http service"
systemctl enable httpd
systemctl start httpd
