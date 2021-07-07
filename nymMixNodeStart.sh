#docker run -t -d --init --name nym1 -v /mixnodes:/home/nym/.nym/mixnodes -p 1789:1789 -p 1790:1790 -p 8000:8000 protektwar/nymmixnode:0.10.1 run --id protektwars7Node
docker run -t -d --init --sysctl net.ipv6.conf.all.disable_ipv6=0 --name nym1 -v /mixnodes:/home/nym/.nym/mixnodes -p 1789:1789 -p 1790:1790 -p 8000:8000 protektwar/nymmixnode:0.10.1 run --id protektwars7Node
