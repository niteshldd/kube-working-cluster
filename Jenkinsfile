pipeline {
  agent any
  stages {
    stage('Docker Build') {
      steps {
        sh "docker build -t niteshldd/multi-client:latest -f ./kube-multi-client/test_com/client/Dockerfile ./kube-multi-client/test_com/client"
      }
    }
    stage('Docker Push') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh "docker push niteshldd/multi-client:latest"
        }
      }
    }
    stage('Apply Kubernetes Files') {
      steps {
          withKubeConfig([credentialsId: 'kubeconfig']) {
          sh 'kubectl get all'
          sh 'kubectl rollout restart deployment -n development'
        }
      }
  }
}
post {
    success {
      slackSend(message: "Pipeline is successfully completed.")
    }
    failure {
      slackSend(message: "Pipeline failed. Please check the logs.")
    }
}
}