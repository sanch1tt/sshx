# Use official Rust image
FROM rust:1.78 as builder

WORKDIR /app
COPY . .

# Build the sshx binary
RUN cargo install --path crates/sshx --locked

# Use minimal runtime image
FROM debian:bullseye-slim

# Create a non-root user
RUN useradd -m appuser
USER appuser

COPY --from=builder /usr/local/cargo/bin/sshx /usr/local/bin/sshx

# Expose default port
EXPOSE 3000

# Start the sshx server
CMD ["sshx", "serve"]
