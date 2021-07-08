FROM nginx:1.20.1
COPY ./index.html /usr/share/nginx/html/index.html
RUN apt-get update && apt install net-tools
