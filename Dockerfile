FROM	alpine:latest

#	Update system
RUN		apk update && apk upgrade

#	Install all nessary programms
RUN		apk add nginx openssl

#	Set working directory where gona download all nessary files execute commands
WORKDIR /var/www/html

#	Copy all nessary source configuration files from local dir "srcs" to the WORKDIR
COPY    ./srcs/ ./

#	Setup nginx conf && generate SSLkey
RUN	mv nginx.conf /etc/nginx/conf.d/default.conf
RUN	openssl req -x509 -nodes -days 365 -subj "/C=RU" -newkey rsa:4096			\
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt
RUN mkdir -p /run/nginx

#	Open 80 and 443 ports for connecting to website
EXPOSE  22 80 443 

CMD	["nginx", "-g", "daemon off;"]
