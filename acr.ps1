echo "Login to azure account"
echo "Run command: az login"
echo "`n"
echo "OUTPUT"
az login
Write-Output "--------------------------------------------------------------------"
echo "`n"

echo "Set to your default account"
echo "Run command: az account set --subscription ""Visual Studio Enterprise"""
echo "`n"
echo "OUTPUT"
az account set --subscription "Visual Studio Enterprise"
Write-Output "--------------------------------------------------------------------"
echo "`n"

echo "Validate that you are in default account"
echo "Run command: az account show"
echo "`n"
echo "OUTPUT"
az account show
Write-Output "--------------------------------------------------------------------"
echo "`n"

echo "Create a Resource Group for the Container Demo"
echo "Run command: az group create --name RGaksmustafa --location eastus"
echo "`n"
echo "OUTPUT"
az group create --name RGaksmustafa --location eastus
Write-Output "--------------------------------------------------------------------"
echo "`n"

echo "Create Container Registry under the new resource group created"
echo "Run command: az acr create --resource-group RGaksmustafa --name ACRaksmustafa --sku Basic"
echo "`n"
echo "OUTPUT"
az acr create --resource-group RGaksmustafa --name ACRaksmustafa --sku Basic
Write-Output "--------------------------------------------------------------------"
echo "`n"

echo "Login to Container Registry created"
echo "Run command: az acr login --name ACRaksmustafa"
echo "`n"
echo "OUTPUT"
az acr login --name ACRaksmustafa
Write-Output "--------------------------------------------------------------------"
echo "`n"

echo "Publish docker images created to container registry"
echo "Run command: docker push  ACRaksmustafa.azurecr.io/dockerdemo"
echo "`n"
echo "OUTPUT"
docker push  ACRaksmustafa.azurecr.io/aks:v1.0
Write-Output "--------------------------------------------------------------------"
echo "`n"
echo "OUTPUT"
docker push  ACRaksmustafa.azurecr.io/aks:v1.0
Write-Output "--------------------------------------------------------------------"
echo "`n"

echo "Verify that repositories has been created representing the container image"
echo "Run command: az acr repository list --name ACRaksmustafa --output table"
echo "`n"
echo "OUTPUT"
az acr repository list --name ACRaksmustafa --output table
Write-Output "--------------------------------------------------------------------"
echo "`n"


