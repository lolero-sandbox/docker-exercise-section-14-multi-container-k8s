docker build -t lolero/docker-excercise-section-8-fib-calculator-client:latest -t lolero/docker-excercise-section-8-fib-calculator-client:$SHA -f ./client
docker build -t lolero/docker-excercise-section-8-fib-calculator-server:latest -t lolero/docker-excercise-section-8-fib-calculator-server:$SHA -f ./server
docker build -t lolero/docker-excercise-section-8-fib-calculator-worker:latest -t lolero/docker-excercise-section-8-fib-calculator-worker:$SHA -f ./worker

docker push lolero/docker-excercise-section-8-fib-calculator-client:latest
docker push lolero/docker-excercise-section-8-fib-calculator-client:$SHA
docker push lolero/docker-excercise-section-8-fib-calculator-server:latest
docker push lolero/docker-excercise-section-8-fib-calculator-server:$SHA
docker push lolero/docker-excercise-section-8-fib-calculator-worker:latest
docker push lolero/docker-excercise-section-8-fib-calculator-worker:$SHA

kubectl apply k8s

kubectl set image deployments/client-deployment client=lolero/docker-excercise-section-8-fib-calculator-client:$SHA
kubectl set image deployments/server-deployment server=lolero/docker-excercise-section-8-fib-calculator-server:$SHA
kubectl set image deployments/worker-deployment worker=lolero/docker-excercise-section-8-fib-calculator-worker:$SHA