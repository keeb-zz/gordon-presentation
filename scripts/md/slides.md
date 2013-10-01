title: In the 6 months since we've launched

---
class: big

## \> 90,000 github pulls


---

## \> 6,000 github stars

---

## \> 150 code contributors

---

##\> 1,700 Dockerfiles on github

---

## Integrations with 

- OpenStack
- Red Hat Linux
- Fedora 
- OpenShift
- Jenkins
- Chef
- Puppet
- Vagrant

---

## Meetups arranged around the world

---

## Heavily used (and in some cases production) at

- Ebay
- Cloudflare
- Rackspace


---

title: Why?
class: segue dark nobackground

---
title: Getting Docker (quick)
content_class: flexbox vcenter

## curl http://get.docker.io | sudo sh

---
title: Learn Docker
content_class: flexbox vcenter

## http://www.docker.io/gettingstarted/

---
title: Docker Index
content_class: flexbox vcenter

## http://index.docker.io

---
title: Using Docker
content_class: flexbox vcenter

## docker run busybox echo hello, world


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

## docker run busybox cat /etc/passwd
<pre class="prettyprint">
root:x:0:0:root:/root:/bin/zsh
daemon:x:1:1:daemon:/usr/sbin:/bin/sh
</pre>


---
title: Images vs. Containers

## docker run busybox rm /etc/passwd
<pre class="prettyprint">


</pre>

---
title: Images vs. Containers

## docker run busybox cat /etc/passwd

<pre class="prettyprint">
root:x:0:0:root:/root:/bin/zsh
daemon:x:1:1:daemon:/usr/sbin:/bin/sh
</pre>

---
title: Why?

# Each *container* is built from a base *image*. A container is an *instance* of an *image*.


---
title: Creating images

<pre class="prettyprint">
>> ~ ID=$(docker run -d busybox rm /etc/passwd)
>> ~ echo $ID
3d85ec
>> ~ IMAGE=$(docker commit $ID keeb/broken-busybox)
>> ~ echo $IMAGE
f29b82
>> ~ docker run $IMAGE cat /etc/passwd
cat: can't open '/etc/passwd': No such file or directory
</pre>

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

title: Introducing Gordon
class: segue dark nobackground

---

content_class: flexbox vcenter
class: image

![Gordon](images/gordon.jpg)

---
title: Gordon's Mission

Gordon's goal is to make Docker's contributors life AWESOME.

---
title: Docker Best Practices

Gordon is a reference for how non-trivial projects can be built, tested, distributed, or run via Docker.

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

# docker ps
<pre class="prettyprint">
ID                  IMAGE                                     COMMAND                CREATED              STATUS              PORTS
40a1120da12a        registry.stinemat.es/keeb/gordon:latest   python website/web/s   About a minute ago   Up About a minute   49154->5000           
3867b55507b7        keeb/hipache:latest                       supervisord -n         About a minute ago   Up About a minute   49153->6379, 80->80   
</pre>

---
title: Let's make a change

---
title: Now build it..

---
title: Then test it..



---
title: Then deploy it..

---
title: How about prod deployment?

---
title: How about multi-cloud deployment?

---
title:Questions?

---
class: image
content_class: flexbox vcenter

![Docker Logo](images/docker-logo.png)



