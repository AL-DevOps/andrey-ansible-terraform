node('ansible') {
    
    stage('Preparation') { // for display purposes
        // Get some code from a GitHub repository
        checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/lidorg-dev/andrey-ansible.git']]])
 
    }
    stage('Build EC2 in AWS') {
  
        sh ''' terraform init
            terraform apply --auto-approve
            '''
            
        
    }
    stage('Run Ansible Playbook') {
       
    }
}
