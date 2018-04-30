# k8s-demo-books
echo password > password.txt
tr --delete '\n' <password.txt >.strippedpassword.txt && mv .strippedpassword.txt password
kubectl create secret generic mysql-pass --from-file=password
