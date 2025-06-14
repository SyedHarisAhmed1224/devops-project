pipeline {
  agent any
  environment {
    TF_DIR = "/workspace/terraform"
    INVENTORY_FILE = "inventory"
    ARM_CLIENT_ID       = 'c58d071f-7512-46a8-8538-41b05534e5b0'
    ARM_CLIENT_SECRET   = '0HD8Q~1B54~D-W6rHKODZmXXvP_UY5UbSRTzrcOu'
    ARM_SUBSCRIPTION_ID = 'f32912ed-d29f-4020-8bc7-0d5b7cf7e7f6'
    ARM_TENANT_ID       = 'a0b05d0e-54f3-4dbb-bdbe-9ec3982b25e2'
  }

  stages {
    stage('Terraform Init') {
      steps {
        dir("/workspace/terraform") {
          sh 'terraform init'
        }
      }
    }

    stage('Terraform Apply') {
      steps {
        dir("/workspace/terraform") {
          sh 'terraform apply -auto-approve'
        }
      }
    }

    stage('Get IP') {
      steps {
        script {
          env.VM_IP = sh(script: "cd ${env.TF_DIR} && terraform output -raw public_ip", returnStdout: true).trim()
          echo "Extracted Public IP: ${env.VM_IP}"
    
          writeFile file: "${env.INVENTORY_FILE}", text: """[web]
    ${env.VM_IP} ansible_user=azureuser ansible_ssh_private_key_file=/root/.ssh/id_rsa
    """
        }
      }
    }

    stage('Run Ansible') {
      steps {
        sshagent(['ansible_ssh_key']) {
          sh '''
            ANSIBLE_HOST_KEY_CHECKING=False \
            ansible-playbook -i inventory /workspace/ansible/install_web.yml
          '''
        }
      }
    }

    stage('Verify') {
      steps {
        sh 'echo "Verifying deployed web app"'
        sh "curl http://${env.VM_IP}"
      }
    }
  }
}
