FROM node:alpine

WORKDIR '/app'

COPY package*.json ./
RUN npm install -s --prefer-offline --no-audit

COPY ./ ./
RUN npm run build -s

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html