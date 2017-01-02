Sensu Example using Docker Compose
----------------------------------

This is an implementation of the default sensu check-memory test in docker.

This creates images for the following services:

 * redis
 * rabbitmq
 * sensu-api
 * sensu-server
 * sensu-client (one with a subscription check, and one with a standalone check)


### Running

docker-compose can be used to run all of the parts easily:

    git clone https://github.com/matthewfranglen/sensu-example
    cd sensu-example
    docker-compose up

to run sensu server:
/opt/sensu/bin/sensu-server -d /etc/sensu/

apt-get update 
apt-get install -y libgmp-dev build-essential
/opt/sensu/embedded/bin/gem install sensu-plugins-kubernetes
/opt/sensu/embedded/bin/check-kube-nodes-ready.rb
https://github.com/sensu-plugins/sensu-plugins-kubernetes/blob/master/bin/check-kube-nodes-ready.rb


check memory check will return something like:
MEM OK - free system memory: 4068 MB