FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# all the static files build will be in /app/build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
