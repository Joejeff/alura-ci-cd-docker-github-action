# syntax=docker/dockerfile:1
FROM golang:1.15 AS build
#WORKDIR /src
RUN go build -o /main ./main.go

FROM ubuntu:latest

EXPOSE 8000

WORKDIR /app

ENV DBHOST=localhost \
    DBPORT=5432 \
    DBNAME=root \
    DBUSER=root \
    DBPASSWORD=root

COPY --from=build ./main main

CMD [ "./main" ]