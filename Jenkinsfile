pipeline {
    agent any
    environment {
       CC = 'clang'
    }
    stages {
        stage('Example') {
            steps {
                sh 'printenv'
                sh 'echo $CC'
            }
        }
    }
}