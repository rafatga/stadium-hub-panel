FROM node:21-alpine

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apk update && apk upgrade

# Copy package.json and package-lock.json
COPY package*.json .

# Copy source code
COPY . .

# Install all dependencies, including dev dependencies
RUN npm install
RUN npm run build

# Expose port
EXPOSE 3000

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

CMD [ "npm", "run", "dev" ]
