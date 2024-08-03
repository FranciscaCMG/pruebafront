mvn clean
mvn install
docker build -t franciscamarquez/ms_vehiculos .
docker push franciscamarquez/ms_vehiculos
cd ..
cd deployment
kubectl delete -f ms-vehiculo-deployment-service.yaml
kubectl apply -f ms-vehiculo-deployment-service.yaml
kubectl get pods
