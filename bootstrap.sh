#!/usr/bin/env bash

# Intended for Ubuntu 14.04 (Trusty)

# Update Ubuntu
# echo "----- Provision: Apt Repositry updating..."
# apt-get update

# install apache 2
echo "----- Provision: install apache2 webserver"
apt-get install apache2 -y

# curl install
# echo "----- Provision: install curl package"
# apt-get install curl -y

# vim editior install
# echo "----- Provision: install editor package"
# apt-get install vim -y

# Restart Apache
echo "----- Provision: Restarting Apache2 webserver..."
service apache2 restart
