pipeline {
    agent {
        kubernetes {
            inheritFrom 'default'
        }
    }

    environment {
        DOCKERHUB_USERNAME = "owenshin"
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