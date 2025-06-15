FROM alpine:latest

# Install curl and bash (sh is fine but some scripts need bash)
RUN apk --no-cache add curl bash

# Run the sshx install+run script
CMD curl -sSf https://sshx.io/get | sh -s run
