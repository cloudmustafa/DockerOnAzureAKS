# DockerOnAzureAKS
.NET core docker container running on Azure Kubernetes service demo

Steps to push the docker image to AKS

1. Run the acr.ps1 script
2. docker login <ACR NAME>
3. docker tag <CONTAINER:VERSION> <AZURE ACR NAME/CONTAINER LABEL:VERSION>
4. docker push  <AZURE ACR NAME/CONTAINER LABEL:VERSION>
5. run the aks.ps1 scipt

