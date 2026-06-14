# Multi-stage Dockerfile for Market Scanner MCP

FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o scanner ./cmd/server/main.go

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/scanner .
CMD ["./scanner"]
