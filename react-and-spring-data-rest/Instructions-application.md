1. Source Control
Use a version control system like Git. You can use GitHub, or Azure Repos.

- Install git on your machine
- Install visual studio code on your machine
- Install docker desktop on your machine and login with your docker account
- Create a repository on GitHub
- Clone the repository to your local machine
- Create a docker file for front react end and backend java code, 
- open cmd prompt and create images locally

cd to directory where dockerfile is located

# create backend image locally
docker build -t javabackendimage:1.0 -f dockerfile.backend . 

# create frontend image locally
docker build -t reactfrontendimage:1.0 -f dockerfile.frontend . 

# create backend container locally
docker run -p 8080:8080 --name javabackendcontainer javabackendimage:1.0

# create frontend container locally
docker run -p 3000:3000 --name reactfrontendcontainer reactfrontendimage:1.0

# Add below lines to package.json file

"scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject",
    "watch": "webpack --watch -d --output ./target/classes/static/built/bundle.js"
}

# create public folder
 created a public folder inside react-and-spring-data-rest 