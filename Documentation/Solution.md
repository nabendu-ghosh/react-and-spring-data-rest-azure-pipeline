![Overview](https://user-images.githubusercontent.com/105546276/169155611-4735b63b-d896-44ca-a847-9c2c52f42b83.png)


Overview: 
-------------------------------------------------------------------------------

When any changes are committed to the repository, the build pipeline gets triggered. The build pipeline then pulls the source code from respository and builds the docker image and pushes it to Azure Container Registry.
Post that the release pipeline gets triggered, and it creates in infrastructure using ARM templates. The next step deploys the application in Azure Web App.
The manual verification task is there to give users time to check the application.
In Test Environment, users have the option to remove the infrastructure to save costs.
With the variable groups users have more control over the release pipeline.

Detailed explanation of the solution is described in the next section.


How to build this solution in your own Azure Environment?
-------------------------------------------------------------------------------------------

Initial Setup:
1. Fork the git repository using the Fork button.
2. Create a Azure Container Registry in Azure portal. You can use the ARM template in infra folder to set it up quickly. Create a service connection for the Container Registry.
3. Create a Azure Key Vault.You can use the ARM template in infra folder. Store the Container Registry Password in the key vault as a secret.

Variable Group Setup:
The variable groups gives more control over the release pipeline. You can choose which steps to run in the pipeline using these.

![image](https://user-images.githubusercontent.com/105546276/169161411-a3c50058-1047-4d10-9ace-d9ef33a80d32.png)

Link your keyvault with the acr-pw variable group. This will be used to fetch the images from the container registry.
![image](https://user-images.githubusercontent.com/105546276/169161742-0ed0c238-6767-4a9e-b326-d1e944e74d20.png)

test-vg variable group gives you the option to choose the name of app service plan & the web app. The other options control wheather you want to create/delete infrastructure.
![image](https://user-images.githubusercontent.com/105546276/169161875-b749326c-0025-4067-93d7-f96d7bcf7722.png)

Similarly the prod-vg variable group:
![image](https://user-images.githubusercontent.com/105546276/169162263-ac4b50ec-9e91-4f7b-b5c6-24edc667f5f4.png)


The Build Pipeline:

The azure-pipelines.yml file contains the build pipeline as code.It has two stages:
The first stages copies the arm templates & parameters file from the infra folder and publishes it. We will be using these files as linked artifacts in the release pipeline to create the infrastructure.

The second stage builds the application using the Dockerfile and pushes the image to the container registry.

A Successful run of the build pipeline will look like this:
![image](https://user-images.githubusercontent.com/105546276/169163708-fb389525-7951-4dbd-a643-d8541e42597a.png)

The Release Pipeline:


