pipeline{
    agent any
        stages{
            stage("Checkout SCM"){
                steps{
                    git url: 'https://github.com/MeghanathReddy1/megwebapp.git', branch:'main'
                }
            }
            
            stage('NPM Build'){
                steps{
                    script{
                        env.PATH = "/usr/local/bin:${env.PATH}"
                        
                        // tool 'NodeJS'
                        sh 'npm install'
                        sh 'npm run build'
                    }
                }
            }
            stage('Dcoker Build'){
                steps{
                    script{
                        sh "docker build -t meghanathreddy/megwebapp:Megha-PROJECT-${BUILD_NUMBER} ."
                    }
                }
            }
            stage('Docker Push'){
                steps{
                    script{
                        withCredentials([string(credentialsId: 'Docker_Hub', variable: 'Docker_Hub')]) {
                            sh "docker login -u meghanathreddy -p ${Docker_Hub}"
                        }
                        sh "docker push meghanathreddy/megwebapp:Megha-PROJECT-${BUILD_NUMBER}"
                    }
                }
            }
        }
}
