
docker network create red1
sleep 20
docker build -t maven-java8 .
sleep 20
docker run -d --name maven-java8-container -v ./target:/app/target --network red1 maven-java8 mvn install
sleep 120
docker build -t my-tomcat-app -f Dockerfiletomcat .
sleep 120
docker run -d -p 8080:8080 --name my-tomcat-container --network red1 my-tomcat-app
sleep 60
docker build -f Dockerfilemaria -t mariadb:11.7 .
sleep 30
docker run --name mariadb_1 -d -e MYSQL_ROOT_PASSWORD=12345678 -p 3306:3306 --network red1 mariadb:11.7
sleep 30
docker exec mariadb_1 bash -c "apt-get update && apt-get install -y mysql-client"
sleep 30
docker cp CreateSQLtask.sql mariadb_1:/tmp/CreateSQLtask.sql
sleep 30
docker exec -i mariadb_1 mysql -u root -p12345678 taskmanager < CreateSQLtask.sql
sleep 5
