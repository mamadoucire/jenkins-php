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
        }
        stage('Install Dependencies') {
            steps {
                // Étape d'installation des dépendances via Composer
                bat 'composer install'
            }
        }
        stage('Run PHPUnit Tests') {
            steps {
                // Exécuter les tests PHPUnit
                bat 'vendor\\bin\\phpunit'
            }
        }
        stage('Build') {
            steps {
                // Étape de construction de votre projet Laravel (par exemple, génération de fichiers de production)
                bat 'php artisan build'
            }
        }
        stage('Deploy') {
            steps {
                // Étape de déploiement de votre projet Laravel (par exemple, copie des fichiers sur un serveur distant)
                bat 'xcopy /E /I /Y public\\ dist\\' // Assurez-vous d'ajuster le chemin de destination selon vos besoins
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
