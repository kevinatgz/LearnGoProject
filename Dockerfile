FROM golang:alpine
# MAINTAINER docker_user docker_user@email.com
# 镜像的操作指令
RUN mkdir /app
ADD . /app/
WORKDIR /app
ENV GO111MODULE=on GOPROXY=https://goproxy.io,direct
RUN go build -o client client.go

ARG conn=2000
ARG ip=docker.for.mac.host.internal

# 容器启动时执行指令
#CMD ["./client","-conn=2000","-ip=docker.for.mac.host.internal"]
#CMD ["./client"]
ENTRYPOINT ["/app/client"]