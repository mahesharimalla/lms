pipeline {
    agent any

    stages {
        stage('Analysis') {
            steps {
                echo 'scanning....'
                sh 'cd webapp && sudo docker run  --rm -e SONAR_HOST_URL="http://3.143.210.52:9000" -e SONAR_LOGIN="sqp_8c7545c0840e89546a76ca7097852a8da41e8540"  -v ".:/usr/src" sonarsource/sonar-scanner-cli -Dsonar.projectKey=lms'
            }
        }
        stage('Build') {
            steps {
                echo 'Building.....'
            }
        }
        stage('Releasing') {
            steps {
                echo 'Releasing.....'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying.....'
            }
        }
    }
}