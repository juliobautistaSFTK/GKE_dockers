
docker network create red1
sleep 20
docker build -t maven-java8 .
sleep 20
docker run -d --name maven-java8-container -v ./target:/app/target --network red1 maven-java8 mvn install
sleep 5
