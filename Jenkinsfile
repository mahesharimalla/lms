pipeline {
    agent any
    environment {
        // More detail: 
        // https://jenkins.io/doc/book/pipeline/jenkinsfile/#usernames-and-passwords
        NEXUS_CRED = credentials('nexus')
   }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'cd webapp && npm install && npm run build'
            }
        }
        stage('Release') {
            steps {
                echo 'Release Nexus'
                sh 'rm -rf *.zip'
                sh 'cd webapp && zip dist-${BUILD_NUMBER}.zip -r dist'
                sh 'cd webapp && curl -v -u $Username:$Password --upload-file dist-${BUILD_NUMBER}.zip http://3.142.50.208:8081/repository/lms/'
            }
        }
    }
}