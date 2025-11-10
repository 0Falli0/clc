# Pull in the layer of the base image: golang:1.23.3-alpine
FROM golang:1.23.3-alpine

# Set author label: LABEL author=[YOUR-EMAIL]
LABEL author="lukas.fallmann27@gmail.com"

# Set working directory: `/opt`
WORKDIR /opt


# Copy local files `go.mod` and `main.go` to the working directory
COPY go.mod main.go /opt/

# List items in the working directory (ls -lsa)
RUN ls -lsa

# Build the app (CGO_ENABLED=0 go build -o /usr/hello-app)
RUN CGO_ENABLED=0 go build -o /usr/hello-app

# Expose the port 8888
EXPOSE 8888

# Set the entrypoint to run the app
ENTRYPOINT [ "/usr/hello-app" ]