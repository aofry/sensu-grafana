FROM matthewfranglen/sensu-base

RUN /opt/sensu/embedded/bin/gem install influxdb

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY config.json /etc/sensu/config.json
#COPY default_handler.json /etc/sensu/conf.d/default_handler.json
#COPY check_memory.json /etc/sensu/conf.d/check_memory.json
COPY check_cpu_metrics.json /etc/sensu/conf.d/checks/check_cpu_metrics.json

RUN chown -R sensu:sensu /etc/sensu

COPY influxdb-metrics.rb /etc/sensu/handlers/metrics/influxdb-metrics.rb
COPY influxdb-metrics.json /etc/sensu/conf.d/influxdb-metrics.json
COPY influxdb-metrics-handler.json /etc/sensu/conf.d/handlers/influxdb-metrics.json

RUN chmod +x /etc/sensu/handlers/metrics/influxdb-metrics.rb

#COPY influxdb_line_protocol.rb /etc/sensu/extensions/influxdb_line_protocol.rb

CMD ["/usr/bin/supervisord"]
