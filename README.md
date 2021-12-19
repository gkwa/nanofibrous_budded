https://www.emqx.com/en/blog/how-to-use-mqtt-in-golang

https://hub.docker.com/_/golang

docker pull golang
docker run -ti golang bash

```
go version
go version go1.13.12 darwin/amd64

go get github.com/eclipse/paho.mqtt.golang
```

RUN go get github.com/eclipse/paho.mqtt.golang
RUN mkdir /src
COPY src/* /src

WORKDIR /src
