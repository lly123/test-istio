FROM golang:1.13.3 as build

ADD src /src
WORKDIR /src
RUN CGO_ENABLED=0 GOOS=linux go build -o /bin/simple-web-server ./

# Final Image
FROM alpine:3.10.3 as release
COPY --from=build /bin/simple-web-server /bin/simple-web-server

ENTRYPOINT ["/bin/simple-web-server"]
