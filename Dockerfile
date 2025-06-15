FROM alpine:latest

# Install necessary packages
RUN apk --no-cache add bash curl python3 py3-pip

# Install Flask
RUN pip install flask

# Create working directory
WORKDIR /app

# Copy your Flask app into the image
COPY app.py .

# Expose Flask port (Render uses 8080)
EXPOSE 8080

# Start both Flask and sshx in background
CMD sh -c "python3 app.py & curl -sSf https://sshx.io/get | sh -s run"
