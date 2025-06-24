# syntax=docker/dockerfile:1
FROM golang:1.15 AS build
#WORKDIR /src
RUN go build -o /main ./main.go

FROM ubuntu:latest

EXPOSE 8000

WORKDIR /app

ENV DBHOST=localhost \
    DBUSER=root \
    DBPASSWORD=root \
    DBNAME=root \
    DBPORT=5432

COPY --from=build ./main main

CMD [ "./main" ]