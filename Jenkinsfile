pipeline {
    agent {
        kubernetes {
            yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    jenkins/agent-type: kaniko
spec:
  containers:
    - name: jnlp
      image: jenkins/inbound-agent:latest
      resources:
        requests:
          memory: "512Mi"
          cpu: "500m"
        limits:
          memory: "1024Mi"
          cpu: "1000m"
    - name: kaniko
      image: gcr.io/kaniko-project/executor:debug
      command:
        - /busybox/cat
      tty: true
      resources:
        requests:
          memory: "2048Mi"
          cpu: "2000m"
        limits:
          memory: "4096Mi"
          cpu: "4000m"
      volumeMounts:
        - name: kaniko-secret
          mountPath: /kaniko/.docker/
  volumes:
    - name: kaniko-secret
      secret:
        secretName: kaniko-secret
            """
        }
    }

    environment {
        DOCKERHUB_USERNAME = "owen"
        IMAGE_NAME = "test"
    }

    stages {
        stage("Build Docker Image & Push to Docker Hub") {
            steps {
                container("kaniko") {
                    script {
                        def context = "."
                        def dockerfile = "Dockerfile"
                        def image = "${DOCKERHUB_USERNAME}/${IMAGE_NAME}:latest"

                        sh "/kaniko/executor --context ${context} --dockerfile ${dockerfile} --destination ${image}"
                    }
                }
            }
        }
    }

    post {
        always {
            echo "The process is completed."
        }
    }
}