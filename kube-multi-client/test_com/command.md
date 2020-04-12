# Here is the code for automate the pipeline of deployment 

- Rollout to update the deployment without any changes in deployment file soultion :) 

kubectl rollout restart deployment client-deployment

- Connect to kubectl master of the docker. We can connect to kubectl docker 


- Delete the config without using YML file 

kubectl get deployment
kubectl delete deployment $client-deployment

## Volumes or PVC 

- Volume is object in world of kubernetes like other pod and services 


- In kubernetes if deployment volume will created and any reason if pod will restart then it will use same volume. If pod will get recreated then volume will get remove and you will have fresh volume with data inside 
- So come up with this issue we use persistent volume, So we can use the same volume again if pod get deleted also 
- Lifecylce of volume with normal volume is tied up with pod. Where lifecycle of PVC is not tied up with anything 


## Differnce between persistent volume and persistent volume claims 

- Persistent Volume claim is place where kubernetes advertise about volume they have 
- If Persistent volume claim  is available then it will handover the volume to the config of the pod. If not availablethen persistent volume will attempt to create one 
- Persisten volume can be provisioned dynamically or static. 

## Storage Class in kube 

- Below are the command 
kubectl get storageclass
kubectl describe storageclass
kubectl edit storageclass
Or we can create new storgae class 

- watch
kubectl get pv pvc-ce24e92d-740c-4967-9a36-07db5c1088a9 --watch 

## Env variable in kube

- We can use env to give values 
- env takes values as arrary - 
- Env value can't be in number like 500 we need to specify like '500'
## Secret in kube

- To store secret in kube we need to create a object also we can utilize vault in later point of time 
- Purpose of secret to store the value and expose to outside of the world 
- For storing secret we need to use impretive command as we don't want to publish 


kubectl create secret generic pgpassword --from-literal PGPASSWORD=dgfdfeqdfedw

- Below are the usage of the option 

- kubectl create secret generic <secret_name> --from-literal PGPASSWORD=newpassword

create -> imperative command to create new object 
secret -> Type of Object (secrect, docker-secret)
<secret_name> -> Name of secret for later refrencing in a pod config 
--from-literal -> we are going to add the secret information into this command, as opposed to form file 
PGPASSWORD=newpassword -> Secret value 

kubectl get secrets

## TO get username and password for master api 
kubectl config view

## Ingress Nginx 
### This are the four type of Services provided by kubernets 
1) NodePort 
2) LoadBalancer -> Deprycated or going to be 
3) ingress
4) ClusterIP 

- We are going to use Ingress for now but need to change to ambasador
- We are going to use ingress-nginx not the kubernetes-nginx
We use this docs to run nginx - https://kubernetes.github.io/ingress-nginx/deploy/

git repo - https://github.com/kubernetes/ingress-nginx

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/mandatory.yaml

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/provider/aws/service-l4.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/provider/aws/patch-configmap-l4.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/provider/aws/patch-configmap-l7.yaml

# Trouble shooting command 
kubectl logs nginx-ingress-controller-7f74f657bd-dmflg -n ingress-nginx
kubectl describe ing


## Ambasador 

kubectl apply -f https://getambassador.io/yaml/ambassador/ambassador-rbac.yaml -n default

kubectl get pods -n default

kubectl apply -f ambassador-service.yaml -n default


## Jenkins for CI/CD

Jenkins username and password 

username - nitesh
password - Welcome@123
email - nitesh@uruvelaa.com 

Step by step explanation - https://developer.ibm.com/technologies/devops/tutorials/configure-a-cicd-pipeline-with-jenkins-on-kubernetes/
Use username and password from 
\home\uruvelaa\.kube 
vi config and get the username and password 

- Jenkins URL - https://jenkins.kube.rukjaana.com/

We can get Jenkins token from 
- kubectl logs deployment/jenkins -c jenkins


## UI GENERATE TOKEN 

kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')

Run this to deploye 
- kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta6/aio/deploy/recommended.yaml

Expose to master - kubectl delete -f kube-multi-client/test_com/dashboard-ingress.yaml

https://api.kube.rukjaana.com/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/node?namespace=_all

## Artcile used for this 

--------DOCS FOR STORAGE ---------------------
Use this blog to do other configuration related to AWS 
https://www.linkedin.com/pulse/aws-running-containers-persistent-volumes-kubernetes-using-natarajan - STorage or end to end wordpress deployment we use this on top of kubernetes official docs 
Working docs for storage - https://dzone.com/articles/using-ebs-and-efs-as-persistent-volume-in-kubernet

https://kubernetes.io/docs/concepts/storage/storage-classes/

Moving the file to new localtion and create link between 

https://stackoverflow.com/questions/36014554/how-to-change-the-default-location-for-docker-create-volume-command
--------DOCS FOR STORAGE ---------------------

