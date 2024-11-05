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
                sh 'java -version'
                sh 'pwd&&ls -la'
            }
        }
        stage('编译'){
            agent {
                docker { image 'maven:3.6.1-jdk-8-alpine' }
            }
            steps{
                sh 'echo 开始'
                sh 'pwd'
                sh 'mvn -v'
//                 sh 'mvn clean package'
                sh 'ls -a'
                sh 'cd /var/jenkins_home/appconfig/maven && pwd && ls'
            }
        }
        stage('生成镜像'){
            steps{
                sh 'echo 编译'
            }
        }
    }
}