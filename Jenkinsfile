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
                echo 'Building.......'
                sh 'cd webapp && npm install && npm run build'
            }
        }
        stage('Release...') {
            steps {
       		    script {
		            echo 'Releasing.....'                
                    def packageJson = readJSON file: 'webapp/package.json'
                    def packageJSONVersion = packageJSON.version
                    echo "${packageJSONVersion}"
           	    }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying.....'
            }
        }
    }
}