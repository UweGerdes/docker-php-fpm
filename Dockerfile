# php-fpm image for nginx

FROM uwegerdes/baseimage
MAINTAINER Uwe Gerdes <entwicklung@uwegerdes.de>

COPY www.conf /home/www.conf

RUN apt-get update && \
	apt-get install -y \
					php-fpm \
					php-imap \
					php-mail \
					php-mysql \
					php-pear \
					php-net-smtp && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	mkdir -p /run/php && \
	find /etc/php/ -name 'php-fpm.conf' -type f -exec sed -i 's/;daemonize = yes/daemonize = no/' {} \; && \
	find /etc/php/ -name 'pool.d' -type d -exec mv /home/www.conf {} \;

VOLUME [ "/run/php" ]

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.0"]

