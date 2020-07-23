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
    stage('Test'){
	 sh """	if sudo docker ps -a | grep mywebapp 
		then
		sudo docker rm -f mywebapp 
		sudo docker run -p 8081:8080 -d --name mywebapp shrutshah/mywebapp:v1
		else
		sudo docker run -p 8081:8080 -d --name mywebapp shrutshah/mywebapp:v1
		fi
        """
    }

	 stage('Deploy'){
	 sh """	
	 	
		
		
		export length=\$(sudo kubectl get deployments | grep mywebapp | wc -l)
		 if [ \$length -gt 0 ]
		 then
		 sudo kubectl rollout restart deployment/mywebapp
		 sudo kubectl rollout status deployment/mywebapp
		 else
		 sudo kubectl create deployment mywebapp --image=shrutshah/mywebapp:v1
		 sudo kubectl scale deployment mywebapp --replicas=3
		 sudo kubectl expose deployment mywebapp --port 8080 --type LoadBalancer
		 fi
		
        """
    }




}
	
