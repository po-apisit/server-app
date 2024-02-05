# Use the official Node.js image as the base image
FROM node:14

# Set environment variables
ENV DB_SERVER=45.144.167.245
ENV DB_DATABASE_TEST=BT_THAI_CAMPS_TEST
ENV DB_DATABASE=BT_THAI_CAMPS
ENV DB_USER=sa
ENV DB_PASSWORD=UzCMCth0981IT@XXz
ENV PORT=5050
ENV NODE_ENV=production

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port on which the app will run
EXPOSE $PORT

# Command to run the application
CMD ["npm", "run", "start"]