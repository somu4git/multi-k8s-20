docker build -t somu4docker/multi-client:latest -t somu4docker/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t somu4docker/multi-server:latest -t somu4docker/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t somu4docker/multi-worker:latest -t somu4docker/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push somu4docker/multi-client:latest
docker push somu4docker/multi-server:latest
docker push somu4docker/multi-worker:latest

docker push somu4docker/multi-client:$SHA
docker push somu4docker/multi-server:$SHA
docker push somu4docker/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=somu4docker/multi-client:$SHA
kubectl set image deployments/server-deployment server=somu4docker/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=somu4docker/multi-worker:$SHA

