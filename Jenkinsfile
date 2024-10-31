pipeline {
    agent any
    environment {
       CC = 'clang'
    }
    stages {
        stage('test') {
            steps {
                sh 'printenv'
                sh 'echo $CC'
            }
        }

        stage('开始'){
            steps{
                sh 'echo 开始'
            }
        }

        stage('编译')(
            steps{
                sh 'echo 编译'
            }
        )
    }
}