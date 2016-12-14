Sensu Example using Docker Compose
----------------------------------

This is an implementation of the default sensu check-memory test in docker.

This creates images for the following services:

 * redis
 * rabbitmq
 * sensu-api
 * sensu-server
 * sensu-client (one with a subscription check, and one with a standalone check)
 * uchiwa

The uchiwa service is exposed on port 3000.

### Running

docker-compose can be used to run all of the parts easily:

    git clone https://github.com/matthewfranglen/sensu-example
    cd sensu-example
    docker-compose up

You can view the uchiwa dashboard at http://localhost:3000

to run sensu server:
/opt/sensu/bin/sensu-server -d /etc/sensu/
