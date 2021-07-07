DOCKERNAME="nym1"
docker run -d -t --name $DOCKERNAME --entrypoint bash protektwar/nymmixnode:latest
docker_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $DOCKERNAME)
docker stop $DOCKERNAME && docker rm $DOCKERNAME
docker run -t --init --rm --name $DOCKERNAME -v /mixnodes:/home/nym/.nym/mixnodes -p 1789:1789 -p 1790:1790 -p 8000:8000 protektwar/nymmixnode:0.10.1 init --host $docker_IP --announce-host 161.97.150.231 --id protektwars7Node --layer 1
#docker run -t --init --rm --name nym1 -v /mixnodes:/home/nym/.nym/mixnodes -p 1789:1789 -p 1790:1790 -p 8000:8000 protektwar/nymmixnode:0.10.1 init --host :: --announce-host 161.97.150.231 --id protektwars7Node --layer 2
#docker run -t --init --rm --name nym1 -v /mixnodes:/home/nym/.nym/mixnodes -p 1789:1789 -p 1790:1790 -p 8000:8000 protektwar/nymmixnode:0.10.1 init --host :: --announce-host 2a02:c206:3007:2641::1 --id protektwars7Node --layer 2
