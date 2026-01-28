# Use Node LTS
FROM node:18

# Set working directory
WORKDIR /lastName_firstName_site

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy project files
COPY . .

# Expose Vite port
EXPOSE 7775

# Start Vite dev server on port 7775
CMD ["npm", "run", "dev", "--", "--host", "--port", "7775"]
