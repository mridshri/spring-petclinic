pipeline {
    agent any
    
    stages {
        stage('Clone repository') {
            steps {
                git 'https://github.com/mridshri/spring-petclinic.git'
            }
        }
        
        stage('Set up Maven') {
            steps {
                sh '''
                    mkdir -p $HOME/.m2
                    echo "<settings><mirrors><mirror><id>central</id><url>https://repo1.maven.org/maven2/</url><mirrorOf>central</mirrorOf></mirror><mirror><id>jcenter</id><url>https://jcenter.bintray.com</url><mirrorOf>central</mirrorOf></mirror></mirrors></settings>" > $HOME/.m2/settings.xml
                '''
            }
        }
        
        stage('Build') {
            steps {
                sh './mvnw package'
            }
        }
        
        stage('Run Tests') {
            steps {
                sh './mvnw test -Dtest=PetClinicIntegrationTests,MySqlTestApplication,PostgresIntegrationTests'
            }
        }
        
        stage('Run Application') {
            steps {
                sh 'java -jar target/*.jar'
            }
        }
    }
}
