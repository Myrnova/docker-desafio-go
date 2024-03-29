FROM golang:alpine3.19  as builder

WORKDIR /app

COPY ./go .

RUN go build main.go

FROM scratch

WORKDIR /app

COPY --from=builder /app/main ./

ENTRYPOINT ["./main"]