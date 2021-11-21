# ft_services
You will discover cluster deployment and management with Kubernetes. You are going to do what is called "clustering". The project consists of implementing an infrastructure with different services. For this, we will use Kubernetes. Each service works in a dedicated container, and the containers have the same name as the associated service. For performance reasons the containers are built on Alpine Linux. To complete the project we need the next components:

# Components
 * MetalLB: Is a Load Balancer that manages external access to its services. It is the only entrance to the cluster.

* Nginx: Is an HTTP and reverse proxy server, a mail proxy server, and a generic TCP/UDP proxy server.

* FTPS: Is an FTP server

* MariaDB: Is a database management system derived from MySQL with a GPL (General Public License).

* Wordpress: Is a CMS(Content Managament System) focused on the creation of any type of web page.

* phpMyAdmin: Is a free software tool intended to handle the administration of MySQL over the web.

* InfluxDB: Is a open-source time series database developed by InfluxData

* Telegraf: Is the open-source server agent to help you collect metrics from your stacks, sensors and systems.

* Grafana: Is a open-source graphing and analisys software. Allows you to query, view, alert, and explore your metrics from Time Series Database Storage(TSDB)

# Technologies
* Docker: Is a open-source project that automates the deployment of applications within software containers.

* Kubernetes: Is an open-source system for automating the deployment, scaling, and handling of containerized applications.

* Minikube: Is a tool that lets you run kubernetes locally. minikube runs a single-node kubernetes cluster on your personal computer.

* VirtualBox: Is virtualization software for x86/amd64 architectures.

* Alpine Linux: Is a Linux distribution based on musl and BusyBox, which aims to be lightweigth and secure by default.

# How to start:
change IP adderes in /src/loadconf.yaml to your local IPV4
macOS:
* Setup Minikube
* Setupe VMvirtual box
* Setup Docker
* bash start.sh

Windows:
* Setup Minikude
* Setup HyperV
* Setup Docker
* open PowerShell as amdinistrator and execute:
cd .\srcs\  
---minikube  
minikube start --driver=hyperv  
minikube docker-env  
minikube addons enable metallb  
minikube addons enable dashboard  
---nginx  
docker build -t nginx_image ./nginx  
kubectl apply -f loadconf.yaml  
kubectl apply -f nginx/srcs/nginx.yaml  
---mysql  
docker build -t mysql_image ./mysql  
kubectl apply -f mysql/mysql-conf.yaml  
kubectl apply -f mysql/mysql-pvc.yaml  
---W_P  
docker build -t wordpress-image ./wordpress  
kubectl apply -f wordpress/wp-conf.yaml  
---PHP  
docker build -t php-image ./phpmyadmin  
kubectl apply -f ./phpmyadmin/php-conf.yaml  
---ftps  
docker build -t ftp-image ./ftps  
kubectl apply -f ./ftps/ftp-conf.yaml 
---influxDB
docker build -t influxdb_image .\influxdb\  
kubectl apply -f ./influxdb/influxdb.yaml  
---grafano  
docker build -t grafana_image ./grafana/  
kubectl apply -f ./grafana/grafana.yaml  
---dashboard  
minikube dashboard  
