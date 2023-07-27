pipeline {
    agent {
        label 'windows' // Utiliser l'agent Windows
    }
    options {
        timestamps() // Ajouter des horodatages aux journaux
    }
    environment {
        PATH = "C:\\chemin\\vers\\php;C:\\chemin\\vers\\composer;C:\\chemin\\vers\\phpunit;${env.PATH}" // Ajouter les chemins d'accès aux exécutables PHP, Composer et PHPUnit
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
    post {
         always {
            // Nettoyer après l'exécution, par exemple, supprimer les fichiers temporaires ou réinitialiser l'environnement si nécessaire
            deleteDir()
        }
        success {
            // Actions à effectuer en cas de réussite du pipeline
            echo 'Build successful!'
        }
        failure {
            // Actions à effectuer en cas d'échec du pipeline
            echo 'Build failed!'
        }
    }
}