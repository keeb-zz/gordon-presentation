title: Speaker Info
Nick Stinemates

github.com/keeb

@keeb

---

title: Getting Docker (quick)
`curl http://get.docker.io | sudo sh`

---


title: Learn Docker
http://www.docker.io/gettingstarted/

---


title: Docker Index
http://index.docker.io

---


title: Using Docker

## docker run busybox echo hello, world


---

title: Docker Processes

## docker ps
Nothing running

---

title: Existing Processes

## docker ps -a
Existing containers

---

title: Images vs. Containers

## docker run busybox cat /etc/passwd
Not so interesting..
## docker run busybox rm /etc/passwd
Oh!
## docker run busybox cat /etc/passwd
What will happen?

---


## Why?

title: Creating images

## docker run .. docker commit

## Dockerfile
..

---


title:Gordon
Gordon is the dotCloud Robot

---


## Gordon image (aww)

---


## Gordon knows how to build itself
Show Dockerfile

---


## Gordon knows how to run itself
Show start script

---


## Lets run it!
Run script

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


