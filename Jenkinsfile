pipeline {
    agent any

    stages {
        stage('Analysis') {
            steps {
                echo 'scanning....'
                sh 'cd webapp && sudo docker run  --rm -e SONAR_HOST_URL="http://18.117.169.13:9000" -e SONAR_LOGIN="sqp_c8920f79f2c00cd04655bd696741c6459ff875c6"  -v ".:/usr/src" sonarsource/sonar-scanner-cli -Dsonar.projectKey=lms'
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