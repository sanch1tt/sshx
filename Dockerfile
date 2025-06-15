FROM alpine:latest

# Install bash, curl, Python, and pip
RUN apk --no-cache add bash curl python3 py3-pip

# Explicitly upgrade pip and install Flask
RUN pip install --upgrade pip && pip install flask

# Set working directory
WORKDIR /app

# Copy Flask app into container
COPY app.py .

# Expose the port for Flask (Render expects 8080)
EXPOSE 8080

# Start Flask app and sshx in parallel
CMD sh -c "python3 app.py & curl -sSf https://sshx.io/get | sh -s run"
