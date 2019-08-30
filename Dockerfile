FROM nginx

WORKDIR /usr/share/nginx/html

RUN apt-get update && apt-get install -y curl
COPY nginx/config/default.conf /etc/nginx/conf.d/default.conf
COPY servers.js /opt/
COPY start.sh /opt/

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

EXPOSE 80

CMD ["sh", "/opt/start.sh"]

