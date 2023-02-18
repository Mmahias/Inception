FROM debian:buster

RUN apt-get update -y && apt-get install -y\
    wget \
    mariadb-client \
    curl \
    php7.3-fpm php7.3-mysql php7.3-json php7.3-xmlrpc \
	php7.3-curl php7.3-gd php7.3-xml php7.3-mbstring expect \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /var/www/html\
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/*

WORKDIR /var/www/html

COPY ./wordpress-6.1.1-fr_FR.tar.gz /var/www/
COPY ./conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./tools/script_wp.sh .

# RUN wget https://fr.wordpress.org/wordpress-6.1.1-fr_FR.tar.gz && \
#     tar xvf wordpress-6.1.1-fr_FR.tar.gz && \
#     mkdir wordpress && \
#     mv wordpress-6.1.1-fr_FR/* wordpress && \
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp-cli

RUN chmod +x ./script_wp.sh

EXPOSE 9000

CMD [ "./script_wp.sh" ]