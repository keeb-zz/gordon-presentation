from ubuntu:12.04
maintainer Nick Stinemates

run apt-get update
run apt-get install -y python-setuptools

add . /slides
workdir /slides
expose 8000

entrypoint ["python", "-m", "SimpleHTTPServer"]
