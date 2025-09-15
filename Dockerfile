FROM golang:1.25-alpine

WORKDIR /

ENV GOPROXY=https://mirrors.aliyun.com/goproxy/,direct

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build -o main .

EXPOSE 3000

CMD [ "./main" ]