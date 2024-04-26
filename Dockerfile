# Use an official Node.js runtime as the base image
FROM node:21-alpine

# Install nginx
RUN apk update && apk add nginx
COPY ./nginx.conf /etc/nginx/nginx.conf

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY ./package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY ./ ./

# Expose the port that the app listens on
EXPOSE 3000

CMD ["npm", "run", "start:indocker"]
