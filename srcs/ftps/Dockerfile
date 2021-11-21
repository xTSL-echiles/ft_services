FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add vim vsftpd\
	supervisor\
	openssl
	
RUN openssl req -newkey rsa:2048 \
            -x509 \
            -sha256 \
            -days 365 \
            -nodes \
            -out /etc/ssl/vsftpd.crt \
            -keyout /etc/ssl/vsftpd.key \
            -subj "/C=RU/ST=Central/L=Moscow/O=21school/OU=ft_server/CN=www.echiles.com"
RUN adduser -D 'echiles'
RUN echo "echiles:1" | chpasswd 
COPY vsftpd.conf /etc/vsftpd/
COPY ./supervisord.conf /etc/supervisord.conf
EXPOSE 21 2100
COPY start.sh ./start.sh
RUN chmod +x start.sh
CMD ["sh", "start.sh"]