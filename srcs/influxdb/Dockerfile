FROM alpine:3.12

RUN apk update
RUN apk add\
    libc6-compat\
    supervisor\
    openrc --no-cache
# Качаем более старую версию influx, а то метрики по App не работают
RUN apk add influxdb --repository=http://dl-cdn.alpinelinux.org/alpine/v3.10/community/
# Установка telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz &&\
    tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C / &&\
    rm telegraf-1.17.0_linux_amd64.tar.gz
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY    supervisord.conf /etc/supervisord.conf
COPY    start.sh ./start.sh
RUN     chmod +x /start.sh
RUN mkdir -p /etc/influxdb
RUN mkdir -p /var/lib/influxdb
# порты и докер-сокет
RUN ./usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf 
EXPOSE 3000

CMD     [ "sh", "start.sh" ]

