export MACHINE="$(docker-machine ip)"
curl -G -XPOST http://$MACHINE:8086/query --data-urlencode "q=CREATE DATABASE sensu"