# Stage 1: Build the Frontend
FROM node:18 AS build
WORKDIR /app/frontend
COPY frontend/package.json ./
RUN npm install
COPY frontend/ ./
RUN npm run build

# Stage 2: Build the Final Application
FROM python:3.9-slim
WORKDIR /app
COPY backend/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the built frontend from the first stage
COPY --from=build /app/frontend/dist ./www

# Copy all of our backend code
COPY backend/ ./backend

# Tell the container which command to run when it starts
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8080"]
