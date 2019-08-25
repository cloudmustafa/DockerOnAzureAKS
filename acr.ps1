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


echo "Create Container Registry under the new resource group created"
echo "Run command: az acr create --resource-group myrg --name ACRDemoSLB --sku Basic"
echo "`n"
echo "OUTPUT"
az acr create --resource-group myrg --name ACRDemoSLB --sku Basic
Write-Output "--------------------------------------------------------------------"
echo "`n"

echo "Login to Container Registry created"
echo "Run command: az acr login --name ACRDemoSLB"
echo "`n"
echo "OUTPUT"
az acr login --name ACRDemoSLB
Write-Output "--------------------------------------------------------------------"
echo "`n"