To create cluster  - https://medium.com/containermind/how-to-create-a-kubernetes-cluster-on-aws-in-few-minutes-89dda10354f4
to crete cluster with spot instamce - https://www.replex.io/blog/the-ultimate-guide-to-deploying-kubernetes-cluster-on-aws-ec2-spot-instances-using-kops-and-eks
to create spot instances with nodes - https://onica.com/blog/devops/aws-spot-instances-with-kubernetes-kops/

Create S3 bucket - aws s3api create-bucket --bucket kops-clothgram-nitesh-state-store --create-bucket-configuration LocationConstraint=ap-south-1
Versioning - aws s3api put-bucket-versioning --bucket $bucket_name --versioning-configuration Status=Enabled



kops create cluster \
--name $cluster_name \
--state $kops_bucket_state \
--cloud aws \
--master-size t2.micro \
--master-count 1 \
--master-zones ap-south-1a \
--node-size t2.micro \
--node-count 1 \
--zones ap-south-1a,ap-south-1b,ap-south-1c \
--ssh-public-key ~/.ssh/id_rsa.pub \
--dry-run --output yaml | tee $cluster_name.yaml

# update on using yml file to create cluster 
kops create -f clothgram.k8s.local.yaml
kops create secret --name clothgram.k8s.local sshpublickey admin -i ~/.ssh/id_rsa.pub --state $kops_bucket_state
kops update cluster clothgram.k8s.local --state $kops_bucket_state
kops update cluster clothgram.k8s.local --yes


To create dashboard - https://github.com/kubernetes/dashboard

Follow below to spot instamce  

to kill proxy - killall kubectl
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-rc7/aio/deploy/recommended.yaml
kubectl proxy
kubectl apply -f dashboard/dashboard-adminuser.yaml
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')

 1315  kops delete -f spot-ig-2.yml --state $kops_bucket_state --yes
 1316  kops create -f spot-ig-2.yml --state $kops_bucket_state
 1317  kops update cluster clothgram.k8s.local --state $kops_bucket_state --yes

## Autscale

First download current script from - https://github.com/kubernetes/kops/tree/master/addons/cluster-autoscaler
chmod +x cluster.sh #note it will deploy the cluster-autoscaler to nodes nothing to do 
:) 



## troubleshoot command 

kubectl get pod cluster-autoscaler-8d8bbdfdd-jsd4f -n kube-system --output=json
kubectl logs -f pod/cluster-autoscaler-db75cc668-qghnb -n kube-system
kubectl logs -f pod/cluster-autoscaler-74546bb644-7lw54 -n kube-system
