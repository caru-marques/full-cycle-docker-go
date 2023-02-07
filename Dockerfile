FROM golang:alpine3.17 AS builder

WORKDIR /app

COPY ./rocks.go . 
COPY ./go.mod .

RUN go build

FROM scratch

WORKDIR /app

COPY --from=builder /app/fullcycle .

CMD [ "./fullcycle" ]