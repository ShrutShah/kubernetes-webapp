node{
    	stage ('SCM Checkout'){
		      git credentialsId: 'github', url: 'https://github.com/ShrutShah/docker-webapp.git'
    	}

    	stage('Mvn clean'){
    		  def mvnhome = tool name: 'maven-1', type: 'maven'
		      def mvncmd = "${mvnhome}/bin/mvn"
		      sh "${mvncmd} clean "
    		
    	}
	stage('Mvn validate'){
    		  def mvnhome = tool name: 'maven-1', type: 'maven'
		      def mvncmd = "${mvnhome}/bin/mvn"
		      sh "${mvncmd} validate"
    		
    	}
	stage('Mvn Compile'){
    		  def mvnhome = tool name: 'maven-1', type: 'maven'
		      def mvncmd = "${mvnhome}/bin/mvn"
		      sh "${mvncmd} compile"
    		
    	}
	stage('Mvn Package'){
    		  def mvnhome = tool name: 'maven-1', type: 'maven'
		      def mvncmd = "${mvnhome}/bin/mvn"
		      sh "${mvncmd} package"
    		
    	}
    stage('Build Docker image'){
              sh "sudo docker build . -t shrutshah/mywebapp:v1"

        }
    stage('Push Docker image'){
            withCredentials([string(credentialsId: 'dockhubp', variable: 'dockerhubpassword')]) {
                sh "sudo docker login -u shrutshah -p ${dockerhubpassword}"
                
            }
              sh "sudo docker push shrutshah/mywebapp:v1"

        }
    stage('Deploy'){
        sh "sudo docker run -p 8081:8080 -d --name mywebapp shrutshah/mywebapp:v1"
    }





}
	
