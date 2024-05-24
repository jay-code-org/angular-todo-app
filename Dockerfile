# Stage 1
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2
FROM nginx:latest
COPY --from=build /app/dist/todo-app/browser /usr/share/nginx/html
EXPOSE 80