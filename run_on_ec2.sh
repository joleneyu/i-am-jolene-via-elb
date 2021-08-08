#!/bin/bash

yum update
yum install ec2-instance-connect -y
yum install apache2 -y

ifconfig
ip addr
netstat -lnpt
service sshd status
pwd
ls -l
git clone 
