# Use the official Golang image as the base
FROM golang:1.24.4-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum first (for caching dependencies)
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the rest of the application source code
COPY . .

# Build the Go app
RUN go build -o main .

# Expose the port the app runs on (adjust if your app uses another port)
EXPOSE 8080

# Run the executable
CMD ["./main"]
