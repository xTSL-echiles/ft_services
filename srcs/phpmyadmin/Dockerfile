FROM alpine:3.12

RUN apk update
RUN apk add nginx\
       php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session\
        supervisor\
        libc6-compat
RUN mkdir /run/nginx && \
    chmod 744 /run/nginx
# качаю предыдущую версию php my admin'a, а то с новой мой nginx не заводится
RUN mkdir -p /www/ && \
    wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz && \
    tar xzvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
    rm phpMyAdmin-5.0.2-all-languages.tar.gz && \
    mv phpMyAdmin-5.0.2-all-languages /www/phpmyadmin && \
    chmod 777 /www/phpmyadmin

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY config.inc.php /www/phpmyadmin/config.inc.php

COPY supervisord.conf /etc/supervisord.conf
COPY start.sh ./start.sh
RUN  chmod +x start.sh
EXPOSE 5000
CMD ["sh", "start.sh"]