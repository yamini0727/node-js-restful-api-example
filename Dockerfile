# Use an official Node.js runtime as the base image
FROM node:16

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install npm dependencies
RUN npm install

# Copy the application source code to the working directory
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Define the startup command
CMD [ "node", "server/server.js" ]
