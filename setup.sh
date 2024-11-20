#!/bin/bash

# Download and install Node.js (LTS version)
curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
apt-get install -y nodejs

# Verify installation
node -v
npm -v

# Install the 'moment' package globally
npm install -g moment

# Verify 'moment' installation
npm list -g moment
