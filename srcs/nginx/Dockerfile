FROM alpine:3.12

RUN apk update && apk upgrade
##NGINX 
RUN apk add openrc --no-cache
RUN apk add nginx openssl openssh supervisor 
RUN apk add vim
##(он запускается сам и запускает еще процессы, т.е. контейнер с процессом висит и далее он накидывает "процессор-детей". 
#Нужно что бы запустить в контейнере более 1 процесса.)
COPY ./srcs/nginx.conf /etc/nginx/nginx.conf	
COPY ./srcs/supervisord.conf /etc/supervisord.conf
#SSH
RUN ssh-keygen -A && \
	adduser -D echiles && \
	echo "echiles:1" | chpasswd
#SSL
RUN openssl req -newkey rsa:2048 \
            -x509 \
            -sha256 \
            -days 365 \
            -nodes \
            -out /etc/ssl/echiles.crt \
            -keyout /etc/ssl/echiles.key \
            -subj "/C=RU/ST=Central/L=Moscow/O=21school/OU=ft_server/CN=www.echiles.com"

EXPOSE 80 443 
#SSH port 
EXPOSE 22
COPY ./srcs/start.sh ./
#NGINX USER
RUN mkdir -p /run/nginx
RUN mkdir /www
RUN chown -R nginx:nginx /var/lib/nginx
#RUN chown -R nginx:nignx /www
COPY ./srcs/index.html /www/index.html
#START WITH SUPERVISOR
RUN chmod +x ./start.sh
ENTRYPOINT sh start.sh