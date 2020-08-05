FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install -s

COPY . .
RUN npm run build -s

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html