#!/bin/bash

# Deployment of Django app
# Handling the errors of the code

# Function to clone the Django app code
code_clone() {
	echo "Cloninig the Django app...."
	if [ -d "django-notes-app" ]; then
	    echo "Directory already exists. skip the clone."
	else
	    git clone https://github.com/LondheShubham153/django-notes-app.git || {
	        echo "Failed the clone the code."
	        return 1
            }
        fi
}

# Function to install the required dependencies.

install_requirements() {
	echo "Installing required dependencies."
	sudo apt-get update && sudo apt-get install -y docker.io nginx docker-compose || {
		echo "Failed to install dependencies"
		return 1
	}
}

# Function to perform required restart


restart_requirements() {
	echo "Performing required restarts...."
	sudo chown "$USER" /var/run/docker.sock || {
		echo "Failed to change ownership of docker.sock."
		return 1
	}	
       
        
        cd django-notes-app || exit

# uncomment the following lines if needed.
	 sudo systemctl start docker
     	 sudo systemctl enable docker
	 sudo systemctl enable nginx
	 sudo systemctl restart docker      
         sudo usermod -aG docker $USER

}

# Function to Deploy the Django app

deploy() {
	echo "Building and Deploying the Django app."
	docker build -t notes-app . && docker compose up -d || {
        	echo "Failed to Build and Deploy the app."
		return 1
	}
}

# Main Deployment script

# Clone the code

echo "**********DEPLOYMENT START**********"

if ! code_clone; then
	cd django-notes-app || exit 1
fi

# Install the requirements

if ! install_requirements; then
	exit 1
fi

# Restart the required

if ! restart_requirements; then
	exit 1
fi

# Deploy the Django app

if ! deploy; then 
	echo "Deployment failed. Mailing the admin...."
	# Add your sendmail and notification logic here
	exit 1
fi

echo "***********DEPLOYMENT END**********"

