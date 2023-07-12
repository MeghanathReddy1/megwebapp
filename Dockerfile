FROM node:14 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
FROM nginx:latest
COPY --from=builder /app/dist/megweapp /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]