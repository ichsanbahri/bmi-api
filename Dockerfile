FROM golang:1.17-alpine
WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download
RUN go get -v -u github.com/go-chi/chi/v5

#RUN go get github.com/go-chi/chi
COPY *.go ./
RUN go build -o /apigo

EXPOSE 8080

CMD ["/apigo"]
