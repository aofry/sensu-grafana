MACHINE="$(docker-machine ip)"
docker run --rm --net=container:sensugrafana_influxdb_1 -it influxdb influx -host $MACHINE