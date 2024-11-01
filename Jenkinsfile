pipeline {
    agent any
    environment {
       CC = 'clang'
    }
    stages {
        stage('环境检查') {
            steps {
                sh 'printenv'
                sh 'echo $CC'
                sh 'git -v'
                sh 'java -v'
            }
        }
        stage('开始'){
            steps{
                sh 'echo 开始'
            }
        }
        stage('编译'){
            steps{
                sh 'echo 编译'
            }
        }
    }
}