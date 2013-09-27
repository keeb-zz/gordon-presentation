title: Getting Docker (quick)
content_class: flexbox vcenter

# curl http://get.docker.io | sudo sh

---
title: Learn Docker
content_class: flexbox vcenter

# http://www.docker.io/gettingstarted/

---
title: Docker Index
content_class: flexbox vcenter

http://index.docker.io

---
title: Using Docker
content_class: flexbox vcenter

docker run busybox echo hello, world


---
title: Docker Processes

docker ps

<pre class="prettyprint">
ID                  IMAGE               COMMAND             CREATED             STATUS              PORTS
</pre>


---
title: Existing Processes

<pre class="prettyprint">
ID                  IMAGE               COMMAND             CREATED             STATUS              PORTS
bd156f00e4cb        busybox:latest      echo hello, world   4 days ago          Exit 0   
</pre>


---
title: Images vs. Containers
content_class: flexbox vcenter

# docker run busybox cat /etc/passwd

Not so interesting..

# docker run busybox rm /etc/passwd

Oh!
# docker run busybox cat /etc/passwd

What will happen?

---
title: Why?

# Each *container* is built from a base *image*. A container is an *instance* of an *image*.


---

title: Creating images

# docker run .. docker commit


---

title: Image Automation

# Dockerfile
<pre class="prettyprint">
from ubuntu:12.04
maintainer Nick Stinemates

run apt-get install -y python-setuptools
run easy_install pip

add . /website
run pip install -r /website/requirements.txt
env PYTHONPATH /website
expose 5000

cmd ["python", "website/web/server.py"]
</pre>

---

title: Gordon

Gordon is the dotCloud Robot

---

title: Gordon
class: image

![Gordon](images/gordon.jpg)

---
title: Gordon knows how to build itself

# Dockerfile
<pre class="prettyprint">
from ubuntu:12.04
maintainer Nick Stinemates

run apt-get install -y python-setuptools
run easy_install pip

add . /website
run pip install -r /website/requirements.txt
env PYTHONPATH /website
expose 5000

cmd ["python", "website/web/server.py"]
</pre>

---

title: Gordon knows how to run itself

<pre class="prettyprint">
#!/usr/bin/env bash

# get the real username and password
source .api_credentials

HIPACHE_CONTAINER=$(docker ps | grep hipache | cut -d" " -f1)

if [[ -z "$HIPACHE_CONTAINER" ]]; then
    echo "hipache is not running"
    exit 1
fi

HOST=172.17.42.1
GORDON_DOMAIN=gordon.docker.io

REDIS_PORT=$(docker port $HIPACHE_CONTAINER 6379)
REDIS_HOST=$HOST

API_CONTAINER=$(docker run -d \
    -e GITHUB_USERNAME=$GITHUB_USERNAME \
    -e GITHUB_PASSWORD=$GITHUB_PASSWORD \
    -e GITHUB_REPO="dotcloud/docker" \
    -e REDIS_HOST=$REDIS_HOST \
    -e REDIS_PORT=$REDIS_PORT \
    registry.stinemat.es/keeb/gordon)

API_PORT=$(docker port $API_CONTAINER 5000)
API_HOST=$HOST

# clear out old keys
redis-cli -h $REDIS_HOST -p $REDIS_PORT del frontend:$GORDON_DOMAIN
redis-cli -h $REDIS_HOST -p $REDIS_PORT rpush frontend:$GORDON_DOMAIN api
redis-cli -h $REDIS_HOST -p $REDIS_PORT rpush frontend:$GORDON_DOMAIN http://$API_HOST:$API_PORT"prettyprint">

</pre>

---
title: Let's run it..

---


## docker ps
It's running..

---


## Let's make a change.
.. make a minor change.

---


## Let's build it!
docker build -t ..

---


## Let's test it!
Run start script

---


## OK, let's deploy it.
docker push ...

---


## OK, let's run it in prod
ssh to prod (linode)
docker pull changes
explain how that happens again..

---


## run start script.

---


## Oh, we want to run it somewhere else?
ssh to digitalocean
docker pull

---


## run script..

---


title:Questions?

---


title:Docker Logo


