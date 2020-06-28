# Docker uwegerdes/php-fpm

## Build

Build the image with (mind the dot):

```bash
$ docker build -t uwegerdes/php-fpm .
```

## Usage

Normal use is with the `docker-compose.yaml` file.

Make sure you run `uwegerdes/mysql` and `uwegerdes/mail` and have `uwegerdes/data` started with a htdocs directory on your system.

Now run the php-fpm container:

```bash
$ docker run -d \
	-v $(pwd)/htdocs:/var/www/htdocs \
	--link mysql \
	--link mail \
	--name php-fpm \
	uwegerdes/php-fpm
```

`php-fpm` needs the php files from `./htdocs` and the application uses network to mysql and mail server.

It opens port 9000 to allow communication for the `uwegerdes/nginx` container.

To see what is happening inside the running container you might want to:

```bash
$ docker exec -it php-fpm tail -f /var/log/www-fpm.log
$ docker exec -it php-fpm bash
```

Hit CTRL-C to stop the tail command and CTRL-D to exit the bash.
