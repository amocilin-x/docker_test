pipeline {
    agent any
    environment {
       WR = '${WORKSPACE}'
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
                args '-v mavenRepo:/opt/repo'
            }
            steps{
                sh 'echo 开始'
                sh 'pwd'
                sh 'mvn -v'
                sh 'cd ${WR} && mvn  clean package -s "/var/jenkins_home/appconfig/maven/settings.xml" -Dmaven.test.skip=true'
                sh 'ls -la'
            }
        }
        stage('运行测试'){
            agent{
                docker { image 'openjdk:8-jdk-alpine'}
            }
            steps{
                sh 'echo 开始测试'
                sh 'cd ${WR} && java -jar target/docker_test.jar'
                sh 'curl http://localhost:8080'
            }
        }
        stage('生成镜像'){
            steps{
                sh 'echo 开始生成镜像'
                sh 'docker build -t docker_java:latest .'
            }
        }

        stage('部署'){
            steps{
                sh 'echo 开始部署'
                sh 'docker rm -f docker_java'
                sh 'docker run -d -p8080:8080 --name docker_java docker_java:latest'
            }
        }
    }
}