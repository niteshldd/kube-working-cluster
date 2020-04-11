# Command to run kubectl

- Cluster name space
kubectl get namespaces

kubectl create -f dev_name.yml 

kubectl delete -f dev_name.yml 

kubectl get namespaces --show-labels

- Switch the working namespaces 
kubectl config set-context --current --namespace=development 
or 
kubectl config use-context dev

- To See current namespaces working on 
kubectl config view | grep namespace

kubectl config current-context

- To see the name space yml file 

kubectl config view

## Kubectl run the pods and services 

kubectl apply -f client-pod.yml
kubectl delete -f client-pod.yml

kubectl get pods
kubectl get service

Master will chose where the pods will get deployed 
 
 ## Imperative and Declarative Method 

- Imperative - Means giving the command and given exact guidance (Hard work on this)

- Declarative - We just say we need to run some pod. Master will chose where to deploy - Uses config file 

## Updating existing Objects 

Alway have the pod config 

1) Name: #always this name should same if we are making changes to exisiting config
2) Kind:
3) image:

- Changes the config file in client-pod.yml  then run below command 

kubectl apply -f client-pod.yml
kubectl describe pods/client-pod

- Updating can only be done for image and some other config


## Running container with Deployment 

Pods

- Pods a single set of containers
- Good of one-off dev purpose
- Rarely used directly in production

Deployment

- Runs a set of identical pods 
- Monitors the state of each pod, Updating as nessecary 
- Good for dev and Prod 

- Below help us to see the configuration of the pods 
kubectl describe pods client-deployment-6744d84985-565s8 


  
docker build -t niteshldd/multi-client:latest -f ./kube-multi-client/test_com/client/Dockerfile ./kube-multi-client/test_com/client
docker build -t niteshldd/multi-server:latest -f ./kube-multi-client/test_com/server/Dockerfile ./kube-multi-client/test_com/server
docker build -t niteshldd/multi-worker:latest -f ./kube-multi-client/test_com/worker/Dockerfile

 

