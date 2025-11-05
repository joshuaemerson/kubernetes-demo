# Use a small base image
FROM node:18-alpine as base
WORKDIR /app

# Install the dependencies seperately for caching
COPY package.json package-lock.json* ./
RUN npm ci --omit=dev

# Copy the app source
COPY . .

# Run as a non root user (alpine includes a user called node)
USER node
EXPOSE 8000
ENV NODE_ENV=production
CMD [ "npm", "start" ]