FROM alpine:latest

# Install bash, curl, python3, pip
RUN apk --no-cache add bash curl python3 py3-pip

# Install Flask (override system package protection)
RUN pip install --break-system-packages --upgrade pip && \
    pip install --break-system-packages flask

# Set working directory
WORKDIR /app

# Copy your Flask app
COPY app.py .

# Expose Flask port
EXPOSE 8080

# Run Flask and sshx together
CMD sh -c "python3 app.py & curl -sSf https://sshx.io/get | sh -s run"
