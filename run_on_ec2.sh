#!/bin/bash

yum update -y
yum install ec2-instance-connect -y
yum install httpd -y
service httpd start
chkconfig httpd on

cd /var/www/html

yum install git -y

git clone https://github.com/joleneyu/i-am-jolene.git

cd i-am-jolene/

pip3 install pelican

pip3 install markdown

cd themes

git clone https://github.com/joleneyu/pelican-alchemy.git

cd ..

make publish-elb

cp -a ./docs/. /var/www/html
