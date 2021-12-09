FROM ubuntu:latest

# Workdir 한줄로 이동되고, 없으면 디렉토리 만들고 이동 or RUN mkdir /app
WORKDIR /app
RUN apt-get update
RUN apt-get install -y nginx
RUN echo "Hello, im ubuntu container."

RUN mkdir ./build

ADD ./build ./build

COPY nginx.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
