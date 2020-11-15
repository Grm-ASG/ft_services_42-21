NAME        =   nginx-deployment
PORT_HTTP   =   80:80
PORT_HTTPS  =   443:443


build:
	docker build -t nginx_image .

test: pre_rec build  create_pod get_pod

delete_deploy:
	kubectl delete deploy $(NAME)

create_deploy:
	kubectl apply -f configmap.yaml
	kubectl apply -f nginx.yaml

get_pod:
	kubectl get pods

get_svc:
	kubectl get svc

get_deploy:
	kubectl get deploy

logs_pod:
	kubectl logs $(NAME)

describe_pods:
	kubectl describe pods $(NAME)

reload_deploy: delete_deploy build create_deploy

re_minikube: stop_minikube delete_minikube start_minikube pre_rec

#
#run:
#	docker run --name $(NAME) -p $(PORT_HTTP) -p $(PORT_HTTPS) -it $(NAME):$(VERSION)


#start:
#	docker start -ai $(NAME)


#stop:
#	docker stop $(NAME)


#exec:
#	docker exec -it $(NAME) /bin/bash


#rm:		stop
#	docker rm $(NAME)


#rmi:	rm
#	docker rmi $(NAME):$(VERSION)
