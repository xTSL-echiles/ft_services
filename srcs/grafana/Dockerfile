FROM alpine:3.12

RUN apk update
RUN apk add\
    libc6-compat\
    supervisor

# Установка grafana
RUN wget https://dl.grafana.com/oss/release/grafana-7.5.5.linux-amd64.tar.gz &&\
     tar -xf grafana-7.5.5.linux-amd64.tar.gz --strip-components=1 -C / &&\
     rm grafana-7.5.5.linux-amd64.tar.gz
# копируем dashboards grafana
COPY grafana.db /data/

COPY    supervisord.conf /etc/supervisord.conf
COPY    start_supervisord.sh ./start_supervisord.sh
RUN     chmod +x /start_supervisord.sh

EXPOSE 3000

CMD     [ "sh", "start_supervisord.sh" ]

