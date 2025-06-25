FROM golang:1.15 AS build

WORKDIR /app
COPY . .
RUN go build -o main .


FROM ubuntu:latest

WORKDIR /app

ENV DBHOST=localhost \
    DBUSER=root \
    DBPASSWORD=root \
    DBNAME=root \
    DBPORT=5432

COPY --from=build /app/main .

EXPOSE 8000

CMD [ "./main" ]
