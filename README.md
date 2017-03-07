# Docker uwegerdes/php-fpm

## Build

Build the image with (mind the dot):

```bash
$ docker build -t uwegerdes/php-fpm .
```

## Usage

Make sure you run `uwegerdes/mysql` and `uwegerdes/mail` and have `uwegerdes/data` started with a htdocs directory on your system.

Now run the php-fpm container:

```bash
$ docker run -d \
	--volumes-from data \
	--link mysql \
	--link mail \
	--name php-fpm \
	uwegerdes/php-fpm
```

`php-fpm` needs the php files from data (the server only sends the http request) and the application uses network to mysql and mail server.

It shares the directory `/run/php` to allow socket communication for the `uwegerdes/nginx` container.

To see what is happening inside the running container you might want to:

```bash
$ docker exec -it php-fpm tail -f /var/log/www-fpm.log
$ docker exec -it php-fpm bash
```

Hit CTRL-C to stop the tail command and CTRL-D to exit the bash.
