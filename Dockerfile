FROM golang:1.19.5-bullseye AS builder
COPY . /go/src/mallory
WORKDIR /go/src/mallory/cmd/mallory
RUN go get .
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' -o /mallory .

FROM scratch
COPY --from=builder /mallory /mallory
ENTRYPOINT ["/mallory"]

