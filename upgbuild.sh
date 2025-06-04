Para Kubernetes SQL con compilación en cloud build

gcloud container clusters get-credentials autopilot-cluster-1 --region us-central1

gcloud projects add-iam-policy-binding maximal-relic-457716-k6 \
  --member="serviceAccount:cloudsql-access@maximal-relic-457716-k6.iam.gserviceaccount.com" \
  --role="roles/logging.logWriter" \
  --condition=None

gcloud projects add-iam-policy-binding maximal-relic-457716-k6 \
  --member="serviceAccount:cloudsql-access@maximal-relic-457716-k6.iam.gserviceaccount.com" \
  --role="roles/storage.objectViewer" \
  --condition=None

rm TaskManager.war 
sudo rm target/TaskManager.war

gsutil cp gs://maximal-relic-war-artifacts-k6/TaskManagerKS.war TaskManager.war

sudo cp TaskManager.war target/

gcloud container images delete gcr.io/maximal-relic-457716-k6/my-tomcat-app:latest

kubectl scale deployment taskmanager-deployment --replicas=0

docker build -f Dockerfiletomcat -t gcr.io/maximal-relic-457716-k6/my-tomcat-app:latest .
docker push gcr.io/maximal-relic-457716-k6/my-tomcat-app:latest

kubectl apply -f taskmanager-deployment.yaml
kubectl apply -f taskmanager-service.yaml

kubectl get pods
kubectl get svc
 
