gcloud container clusters get-credentials autopilot-cluster-1 --region us-central1

gcloud projects add-iam-policy-binding maximal-relic-457716-k6 \
  --member="serviceAccount:cloudsql-access@maximal-relic-457716-k6.iam.gserviceaccount.com" \
  --role="roles/logging.logWriter" \
  --condition=None

gcloud projects add-iam-policy-binding maximal-relic-457716-k6 \
  --member="serviceAccount:cloudsql-access@maximal-relic-457716-k6.iam.gserviceaccount.com" \
  --role="roles/storage.objectViewer" \
  --condition=None


gsutil cp gs://maximal-relic-war-artifacts-k6/TaskManagerK.war TaskManager.war

sudo cp TaskManager.war target/

kubectl scale deployment tomcat-deployment --replicas=0

gcloud container images delete gcr.io/maximal-relic-457716-k6/my-tomcat-appk:latest
docker stop maven-java8-containerk
docker rm maven-java8-containerk
docker build -f Dockerfiletomcat -t gcr.io/maximal-relic-457716-k6/my-tomcat-appk:latest .
docker push gcr.io/maximal-relic-457716-k6/my-tomcat-appk:latest
kubectl apply -f tomcat-deployment.yaml
kubectl apply -f tomcat-service.yaml
kubectl get pods
kubectl get svc
