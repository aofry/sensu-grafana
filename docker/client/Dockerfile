FROM matthewfranglen/sensu-base

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY config.json /etc/sensu/config.json
COPY client.json /etc/sensu/conf.d/client.json
COPY check-memory.sh /etc/sensu/plugins/check-memory.sh

RUN chown -R sensu:sensu /etc/sensu
RUN chmod +x /etc/sensu/plugins/check-memory.sh

CMD ["/usr/bin/supervisord"]
