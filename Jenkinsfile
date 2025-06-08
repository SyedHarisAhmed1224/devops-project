pipeline {
  agent any

  stages {
    stage('Terraform Init') {
      steps {
        dir('terraform') {
          sh 'terraform init'
        }
      }
    }
    stage('Terraform Apply') {
      steps {
        dir('terraform') {
          sh 'terraform apply -auto-approve'
        }
      }
    }
    stage('Extract IP') {
      steps {
        script {
          def ip = sh(script: "terraform -chdir=terraform output -raw public_ip", returnStdout: true).trim()
          writeFile file: 'inventory.ini', text: "[web]\n${ip} ansible_user=azureuser ansible_ssh_private_key_file=~/.ssh/id_rsa"
        }
      }
    }
    stage('Configure with Ansible') {
      steps {
        sh 'ansible-playbook -i inventory.ini ansible/install_web.yml'
      }
    }
    stage('Test Deployment') {
      steps {
        script {
          def ip = readFile('inventory.ini').readLines()[1].split()[0]
          sh "curl http://${ip}"
        }
      }
    }
  }
}
