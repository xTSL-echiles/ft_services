FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client openrc supervisor
COPY create_database.sql ./
COPY wp_db.sql ./
COPY start.sh .

RUN mkdir "/run/mysqld" && chown -R mysql /run/mysqld
RUN chmod +x start.sh
RUN chmod +x create_database.sql
COPY ./my.cnf /etc/mysql/my.cnf
EXPOSE 3306

CMD sh start.sh