FROM golang:alpine AS build-env
RUN mkdir /go/src/app && apk update && apk add git
ADD ./main.go /go/src/app/
WORKDIR /go/src/app
RUN go build -o app main.go

From scratch
WORKDIR /app
COPY --from=build-env /go/src/app/app .
ENTRYPOINT [ "./app" ]
