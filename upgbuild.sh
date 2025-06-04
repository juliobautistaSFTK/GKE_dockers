rm TaskManager.war 
sudo rm target/TaskManager.war

gcloud container clusters get-credentials autopilot-cluster-1 --region us-central1

gcloud projects add-iam-policy-binding maximal-relic-457716-k6 \
  --member="serviceAccount:cloudsql-access@maximal-relic-457716-k6.iam.gserviceaccount.com" \
  --role="roles/logging.logWriter" \
  --condition=None

gcloud projects add-iam-policy-binding maximal-relic-457716-k6 \
  --member="serviceAccount:cloudsql-access@maximal-relic-457716-k6.iam.gserviceaccount.com" \
  --role="roles/storage.objectViewer" \
  --condition=None

gsutil cp gs://maximal-relic-war-artifacts-k6/TaskManager.war TaskManager.war

docker cp TaskManager.war my-tomcat-container:/usr/local/tomcat/webapps/

docker restart my-tomcat-container

