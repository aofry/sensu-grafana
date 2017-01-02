FROM matthewfranglen/sensu-base

RUN apt-get update
RUN apt-get install -y libgmp-dev build-essential
RUN /opt/sensu/embedded/bin/gem install sensu-plugins-kubernetes

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY config.json /etc/sensu/config.json
COPY client.json /etc/sensu/conf.d/client.json
COPY check_morning.json /etc/sensu/conf.d/check_morning.json
COPY check-morning.sh /etc/sensu/plugins/check-morning.sh

RUN chown -R sensu:sensu /etc/sensu
RUN chmod +x /etc/sensu/plugins/check-morning.sh

CMD ["/usr/bin/supervisord"]
