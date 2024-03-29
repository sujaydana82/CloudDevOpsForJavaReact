✨ Source Control
Use a version control system like Git. You can use GitHub, or Azure Repos.

- Install git on your machine
- Install visual studio code on your machine
- Install docker desktop on your machine and login with your docker account
- Create a repository on GitHub
- Clone the repository to your local machine
- Create a docker file for front react end and backend java code, 
- open cmd prompt and create images locally

cd to directory where dockerfile is located

✨ create docker image locally
docker build -t <YourImageName>:1.0 -f dockerfile . 

✨ create docker container locally
docker run -p 8080:8080 --name <YourcontainerName> <YourImageName>:1.0

✨ Changes made in application code base.
package.json,application.properties, pom.xml

✨ create public folder
 created a public folder inside react-and-spring-data-rest 

✨ Create azure-pipeline.yml to deploy in azure apps

✨ Through this pipeline It will create docker image and deploy to container registry and then it will create and run container in azure app service.



