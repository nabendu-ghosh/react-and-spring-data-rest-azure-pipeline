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

