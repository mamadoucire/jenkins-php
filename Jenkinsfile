pipeline {
    agent {
    label 'windows'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/mamadoucire/jenkins-php.git'
            }
        }
        stage('Install') {
            steps {
                bat 'composer install'
            }
        }
        stage('Test') {
            steps {
                bat 'vendor/bin/phpunit'
            }
        }
        
    }
    
}
