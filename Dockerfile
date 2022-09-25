FROM jenkins/jenkins:centos7

USER root

RUN yum -y install epel-release 
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN yum-config-manager --enable remi-php74
RUN yum install php php-mbstring php-xml php-pdo php-pdo_mysql php-xdebug -y
RUN yum update -y

FROM composer:latest
