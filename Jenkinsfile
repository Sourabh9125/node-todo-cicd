@Library('shared') _
pipeline{
    agent {label 'dev'};
    stages{
        stage("workspace clean"){
            steps{
                script{
                  clean_ws()
                }
            }
        }
        stage("code clone"){
            steps{
                script{
            clone("https://github.com/Sourabh9125/node-todo-cicd.git", "dev")
                }
        }
    }
        
        stage("trivy scan"){
            steps{
                script{
                    trivy()
                }
            }
        }
        stage("docker build"){
        steps{
            script{
            docker_build("nodo-todo-cicd ","v1") 
            }
        }
    }
        stage("testing"){
        steps{
            echo "testing the code"
        }
    }
        stage("push to dockerHub"){
        steps{
            script{
                docker_hub("dockerHubCreds", "nodo-todo-cicd ","v1")
            }
        }
    }
        stage("deploying "){
        steps{
            script{
                docker_compose()
            }
        }
    }
 }

 post{
     failure{
         script{
             emailext from: "lodhisaurabh9125@gmail.com",
             to: "lodhisourabh4678@gmail.com",
             body: "pipeline failure check immeidatly",
             subject: "pipeline status"
         }
     }
 }   
}
