export aws_access_key=AKIA5H6UKOUM4Z7IRONA
export aws_secret_key=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
export aws_region=ap-south-1
export kumar='singh'
export bucket_name=kops-clothgram-nitesh-state-store
export KOPS_STATE_STORE=s3://kops-clothgram-nitesh-state-store
export cluster_name=clothgram.k8s.local


CLUSTER_NAME="clothgram.k8s.local"
CLOUD_PROVIDER=aws
IMAGE=k8s.gcr.io/cluster-autoscaler:v1.10.0
MIN_NODES=1
MAX_NODES=4
AWS_REGION=ap-south-1
INSTANCE_GROUP_NAME="nodes"
ASG_NAME="${INSTANCE_GROUP_NAME}.${CLUSTER_NAME}"   #ASG_NAME should be the name of ASG as seen on AWS console.
IAM_ROLE="nodes.${CLUSTER_NAME}"                  #Where will the cluster-autoscaler process run? Currently on the master node.
SSL_CERT_PATH="/etc/ssl/certs/ca-certificates.crt"