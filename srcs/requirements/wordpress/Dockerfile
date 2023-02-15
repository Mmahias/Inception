FROM debian:buster

RUN apt update -y && apt install -y\
    vim \
    wget \
    mariadb-client \
    curl && \
    mkdir -p /var/www/html && \
    chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

COPY ./tools/script_wp.sh .

RUN wget https://fr.wordpress.org/wordpress-6.1.1-fr_FR.tar.gz && \
    tar xvf wordpress-6.1.1-fr_FR.tar.gz && \
    mkdir wordpress && \
    mv wordpress-6.1.1-fr_FR/* wordpress && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp-cli

RUN chmod +x ./script_wp.sh

EXPOSE 9000

CMD [ "./script_wp.sh" ]