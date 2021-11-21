#!/bin/sh
minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb
kubectl apply -f ./srcs/loadconf.yaml
#nginx
docker build -t nginx_image ./srcs/nginx
kubectl apply -f ./srcs/nginx/srcs/nginx.yaml
#mysql
docker build -t mysql_image ./srcs/mysql
kubectl apply -f ./srcs/mysql/mysql-conf.yaml
kubectl apply -f ./srcs/mysql/mysql-pvc.yaml
#WP
docker build -t wordpress-image ./srcs/wordpress/
kubectl apply -f ./srcs/wordpress/wp-conf.yaml
#PHP
docker build -t php-image ./srcs/phpmyadmin/
kubectl apply -f ./srcs/phpmyadmin/php-conf.yaml
#FTPS
docker build -t ftp-image ./srcs/ftps/
kubectl apply -f ./srcs/ftps/ftp-conf.yaml
#influxDB
docker build -t influxdb_image ./srcs/influxdb/
kubectl apply -f ./srcs/influxdb/influxdb.yaml
#grafana
docker build -t grafana_image ./srcs/grafana/ 
kubectl apply -f ./srcs/grafana/grafana.yaml
#dashboard
minikube dashboard