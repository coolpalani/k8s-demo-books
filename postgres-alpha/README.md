## Deploy Postgres on Kubernetes
1. Deploy postgres with a persistent volume claim
   ```
   kubectl create -f specs/postgres.yml
   ```

2. Create a config map with the hostname of Postgres
   ```
   kubectl create configmap hostname-config --from-literal=postgres_host=$(kubectl get svc postgres -o jsonpath="{.spec.clusterIP}")
  ```