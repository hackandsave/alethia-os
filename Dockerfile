# Stage 1: Build the Frontend
# Use a specific version of Node.js for reproducibility
FROM node:18-alpine AS build

# Set the working directory
WORKDIR /app/frontend

# Copy package.json AND package-lock.json for consistent installs
COPY frontend/package*.json ./

# Use 'npm ci' for faster, more reliable, and secure builds in CI/CD environments
RUN npm ci

# Copy all the frontend source code, including tsconfig.json
COPY frontend/ ./

# Run the build command
RUN npm run build


# Stage 2: Build the Final Application
# Use a specific version of Python for reproducibility
FROM python:3.9-slim

WORKDIR /app

# Install Python dependencies
COPY backend/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the built frontend assets from the 'build' stage
# This is the key to a small and secure final image
COPY --from=build /app/frontend/dist ./www

# Copy the backend source code
COPY backend/ ./backend

# Expose the port the application will run on
EXPOSE 8080

# Tell the container which command to run when it starts
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8080"]
