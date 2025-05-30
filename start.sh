#!/bin/bash

# Update and upgrade system
apt-get update && apt-get -y upgrade

# Install tmate and dependencies
apt-get install -y tmate curl openssh-client

# Start tmate and print SSH connection info
echo "Starting tmate session..."

# Start tmate in the background
tmate -S /tmp/tmate.sock new-session -d

# Wait until the SSH connection string is available
echo "Waiting for SSH connection string..."

while ! tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'; do
  sleep 1
done

# Print SSH connection string for user
echo "SSH connection string:"
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'

# Keep the session alive (attach to tmate session)
tmate -S /tmp/tmate.sock attach
