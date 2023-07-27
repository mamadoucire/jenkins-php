pipeline {
    agent {
        label 'windows' // Utiliser l'agent Windows
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Étape de récupération du code source depuis un référentiel Git
                git 'https://github.com/mamadoucire/jenkins-php.git'
            }
        stage('Install Dependencies') {
            steps {
                // Étape d'installation de Composer
                bat 'php --version'
                bat 'php -r "copy(\'https://getcomposer.org/installer\', \'composer-setup.php\');"'
                bat 'php composer-setup.php'
                bat 'php -r "unlink(\'composer-setup.php\');"'
                bat 'php composer.phar clear-cache'
                bat 'php composer.phar self-update'
                // Étape d'installation des dépendances via Composer
                bat 'php composer.phar install'
            }
        }
        stage('Test') {
            steps {
                // Étape de test de votre projet PHP (par exemple, exécution de tests unitaires, etc.)
                bat 'php vendor/bin/phpunit tests/'
            }
        }
        stage('Build') {
            steps {
                // Étape de construction de votre projet PHP (par exemple, exécution de tests, génération de fichiers, etc.)
                bat 'php build.php'
            }
        }
        stage('Deploy') {
            steps {
                // Étape de déploiement de votre projet PHP (par exemple, copie des fichiers sur un serveur distant)
                bat "xcopy /E /I /Y src/ dist/"
                // ou utilisez d'autres commandes spécifiques à votre processus de déploiement
            }
        }
        
    }
}