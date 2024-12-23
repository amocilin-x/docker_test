def createVersion() {
    return new Date().format('yyyyMMddHHmmss')
}
pipeline {
    agent any
    environment {
       WR = "$WORKSPACE"
       time=createVersion()
    }
    stages {
        stage('环境检查') {
            steps {
                sh 'echo $WR'
                sh 'printenv'
            }
        }
        stage('编译'){
            agent {
                docker {
                    image 'maven:3.6.1-jdk-8-alpine'
                    args '-v mavenRepo:/opt/repo'
                }
            }
            steps{
                sh 'echo 开始'
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
                sh 'cd ${WR} &&cd target  &&ls -al&& nohup java -jar docker_test-0.0.1.jar &'
                sh 'jps -l'
            }
        }
        stage('生成镜像'){
            steps{
                sh 'echo 开始生成镜像'
                sh 'docker build -t docker_java:${time} .'
            }
        }

        stage('部署'){
            steps{
                sh 'echo 开始部署'
                sh 'docker rm -f docker_java'
                sh 'docker run -d -p8378:8080 --name docker_java docker_java:${time}'
            }
        }
    }
}