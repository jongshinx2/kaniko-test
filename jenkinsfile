pipeline {
    agent { label 'kaniko-pod' }
    stages {
        stage('Build') {
            steps {
                container('kaniko') {
                    sh '/kaniko/executor --context=`pwd` --destination=owenshin/myapp:v1'
                }
            }
        }
    }
}