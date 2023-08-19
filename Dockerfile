FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    software-properties-common \
    nginx \
    composer \
    curl  \
    nano \
    python3 \
    npm

RUN apt install -y php8.1-fpm php8.1-bcmath php8.1-cli php8.1-common php8.1-curl php8.1-dev php8.1-fpm php8.1-gd php8.1-imagick php8.1-mbstring php8.1-memcache php8.1-mongodb php8.1-mysql php8.1-redis

RUN apt install -y php8.1-opcache php8.1-pgsql php8.1-pspell php8.1-readline php8.1-snmp php8.1-sqlite3 php8.1-ssh2 php8.1-xml php8.1-xmlrpc php8.1-xsl php8.1-zip

RUN apt-get -y install pip

RUN apt-get -y install nodejs

RUN curl -sS https://getcomposer.org/installer | php 
RUN mv composer.phar /usr/local/bin/composer

RUN composer global require laravel/installer


#sites configurations
COPY ./nginx/nginx-site.conf /etc/nginx/sites-available/default

RUN chmod 777 -R /var

WORKDIR /app
COPY . .

RUN pip3 install -r ./flask/requirements.txt
RUN chmod 777 -R /app

EXPOSE 80 81 82 83
CMD ["sh", "-c", "service php8.1-fpm start & python3 /app/flask/app.py & node /app/node/index.js & nginx -g 'daemon off;'"]

#CMD service php8.1-fpm start && nginx -g "daemon off;"
