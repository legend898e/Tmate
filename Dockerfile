# Use Ubuntu 24.04 base image
FROM ubuntu:24.04

# Set environment to noninteractive to avoid prompts during apt
ENV DEBIAN_FRONTEND=noninteractive

# Copy start.sh to container
COPY start.sh /start.sh

# Make start.sh executable
RUN chmod +x /start.sh

# Entrypoint to run start.sh
ENTRYPOINT ["/start.sh"]
