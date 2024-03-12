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

2. create backend image locally
docker build -t javabackendimage:1.0 -f dockerfile.backend . 

3. create frontend image locally
docker build -t reactfrontendimage:1.0 -f dockerfile.frontend . 

4. create backend container locally
docker run -p 8080:8080 --name javabackendcontainer javabackendimage:1.0

5. create frontend container locally
docker run -p 3000:3000 --name reactfrontendcontainer reactfrontendimage:1.0

6. Add below lines to package.json file

"scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject",
    "watch": "webpack --watch -d --output ./target/classes/static/built/bundle.js"
}

7. create public folder
 created a public folder inside react-and-spring-data-rest 

8. Create azure-pipeline.yml to deploy in azure apps

Through this pipeline It will create docker image and deploy to container registry and then it will create and run container in azure app service.