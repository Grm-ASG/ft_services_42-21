FROM	alpine:latest

#	Update system
RUN		apk update && apk upgrade

#	Install all nessary programms
RUN		apk add nginx openssl vim

RUN 	mkdir -p /run/nginx

#	Setup nginx conf 
COPY    ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY    ./srcs/index.html /var/lib/nginx/html/index.html

#	Generate SSLkey
RUN		openssl req -x509 -nodes -days 365 -subj "/C=RU" -newkey rsa:4096			\
		-keyout /etc/ssl/private/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt

#	Open 22 for ssh, 80 and 443 ports for connecting to website
EXPOSE  22 80 443 

CMD		["nginx", "-g", "daemon off;"]