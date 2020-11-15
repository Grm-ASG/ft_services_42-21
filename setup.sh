#!/bin/bash

#stop the existing minukube cluster
minikube stop
#delete the existing minukube cluster
minikube delete
#start new minikube cluster
minikube start --vm-driver=virtualbox

#set docker env in minikube
eval $(minikube docker-env)

#include Metallb addon in minikube
minikube addons enable metallb

#build nginx image in minikube
docker build -t nginx_image ./srcs/Nginx/

#apply two configs with loadbalancer and nginx service/container
kubectl apply -f ./srcs/Nginx/configmap.yaml
kubectl apply -f ./srcs/Nginx/nginx.yaml