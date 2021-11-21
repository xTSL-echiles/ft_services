FROM    alpine:3.12

RUN     apk update
RUN     apk add nginx supervisor php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session


RUN     mkdir /run/nginx &&\
        chmod 744 /run/nginx &&\
        mkdir -p /www/ && \
        cd /www &&\
        wget http://wordpress.org/latest.tar.gz && \
        tar -xzvf latest.tar.gz && \
        rm latest.tar.gz &&\
        cd -

COPY    nginx.conf /etc/nginx/conf.d/default.conf
COPY    supervisord.conf /etc/supervisord.conf
COPY    wp-config.php /www/wordpress

COPY    start.sh ./start.sh
RUN     chmod +x /start.sh
EXPOSE  5050
CMD    ["sh", "start.sh"]