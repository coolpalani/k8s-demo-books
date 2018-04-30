wordpress-db:
	kubectl create secret generic mysql-pass --from-literal=password=mydb
	kubectl get secrets
	kubectl create -f mysql-deployment.yaml
	kubectl get pvc
	kubectl get pods
wordpress-frontend-web:
	kubectl create -f wordpress-deployment.yaml
	kubectl get pvc
	kubectl get services wordpress
wordpress-db-delete:
	kubectl delete -f mysql-deployment.yaml
wordpress-frontend-web-delete:
	kubectl delete -f wordpress-deployment.yaml
ecommerce-namespace:
	kubectl create -f sock-shop-ns.yaml
	kubectl get ns -n sock-shop
ecommerce-microservice:
	kubectl create -f complete-demo.yaml
	kubectl get po -n sock-shop
