# Use the latest Node.js LTS version
FROM node:22-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
# We copy package.json first to leverage Docker's cache
COPY package*.json ./
RUN npm install --production

# Copy the rest of the application code (including server.js)
COPY . .

# Your server.js is configured to listen on port 5050
EXPOSE 5050

# Start the application
CMD [ "node", "server.js" ]