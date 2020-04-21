# Below are the steps which help to deploy clothgram 

Copy the file from local running container 

- docker cp 1314b1a32648:/app/media /home/uruvelaa/nitesh

Copy the file to kubernete cluster 

- kubectl cp /home/uruvelaa/nitesh/media/ development/clothgram-server-deployment-54598c59d4-lctcd:/app/

Article which help to solve this 

-> https://dev.to/mfahlandt/copy-files-from-and-to-kubernetes-pods-and-docker-container-4lgh

-> https://kubernetes.io/docs/tasks/debug-application-cluster/get-shell-running-container/




kubectl exec -it shell-demo -- /bin/bash