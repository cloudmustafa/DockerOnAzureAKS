echo "Create variables to store Azure Registry ID, Service Principal ID and Client Secret (Password)"
echo "Run command: New-Variable -Name ""AzureRegistryID"""
echo "`n"
New-Variable -name AzureRegistryID
echo "Run command: New-Variable -Name ""ServicePrincipalID"""
echo "`n"
New-Variable -name ServicePrincipalID
echo "Run command: New-Variable -Name ""ServicePrincipalPassword"""
echo "`n"
New-Variable -name ServicePrincipalPassword
Write-Output "--------------------------------------------------------------------"
echo "`n"

echo "Store Azure Registry ID to the new variable AzureRegistryID"
echo "Run command: Set-Variable -Name AzureRegistryID -Value (az acr show --resource-group RGaksmustafa --name ACRaksmustafa --query ""id"")"
echo "`n"
Set-Variable -Name AzureRegistryID -Value $(az acr show --resource-group RGaksmustafa --name ACRaksmustafa --query "id")
echo "OUTPUT"
$AzureRegistryID
Write-Output "--------------------------------------------------------------------"
echo "`n"


echo "Create the Service Principal with access rights to registry. Store the Service Principal password to the variable ServicePrincipalID"
echo "Run command: Set-Variable -Name ServicePrincipalPassword -Value (az ad sp create-for-rbac --name http://aksmustafa --scope AzureRegistryID --role acrpull --query password)"
echo "`n"
Set-Variable -Name ServicePrincipalPassword -Value $(az ad sp create-for-rbac --name https://aksmustafa --scope $AzureRegistryID --role acrpull --query password)
echo "OUTPUT"
$ServicePrincipalPassword
echo "`n"
echo "Run command: Set-Variable -Name ServicePrincipalID -Value (az ad sp show --id https://aksmustafa --query appId)"
echo "`n"
Set-Variable -Name ServicePrincipalID -Value $(az ad sp show --id https://aksmustafa --query appId)
echo "OUTPUT"
$ServicePrincipalID
Write-Output "--------------------------------------------------------------------"
echo "`n"

echo "Create AKS Cluster with one node"
echo "Run command: az aks create --resource-group RGaksmustafa --name CLUSTERaksmustafa --node-count 1 --service-principal ServicePrincipalID --client-secret ServicePrincipalPassword --generate-ssh-keys"
echo "`n"
echo "OUTPUT"
az aks create --resource-group RGaksmustafa --name CLUSTERaksmustafa --node-count 2 --service-principal $ServicePrincipalID --client-secret $ServicePrincipalPassword --generate-ssh-keys
Write-Output "--------------------------------------------------------------------"
echo "`n"

echo "Merge credentials of AKS cluster to your local .kube config file"
echo "Run command: az aks get-credentials --resource-group RGaksmustafa --name CLUSTERaksmustafa --overwrite-existing"
echo "`n"
echo "OUTPUT"
az aks get-credentials --resource-group RGaksmustafa --name CLUSTERaksmustafa --overwrite-existing
Write-Output "--------------------------------------------------------------------"
echo "`n"

echo "Verify AKS Nodes are available"
echo "Run command: kubectl get nodes"
echo "`n"
echo "OUTPUT"
kubectl get nodes
Write-Output "--------------------------------------------------------------------"
echo "`n"

echo "Create an ACR image pull secret key which will authorize AKS to pull images from ACR using the Service Principal created earlier"
echo "Run command: kubectl create secret docker-registry acr-auth --docker-server ACRaksmustafa.azurecr.io --docker-username ServicePrincipalID --docker-password ServicePrincipalPassword --docker-email joydeep.ghosh@us.sogeti.com"
echo "`n"
echo "OUTPUT"
kubectl create secret docker-registry acr-auth --docker-server ACRaksmustafa.azurecr.io --docker-username $ServicePrincipalID --docker-password $ServicePrincipalPassword --docker-email joydeep.ghosh@us.sogeti.com
Write-Output "--------------------------------------------------------------------"
echo "`n"

echo "Pull images from ACR and deploy to AKS"
echo "Run command: kubectl apply -f Deployment.yaml"
echo "`n"
echo "OUTPUT"
kubectl apply -f Deployment.yaml
Write-Output "--------------------------------------------------------------------"
echo "`n"

echo "Verify the pods created"
echo "Run command: kubectl get pods"
echo "`n"
echo "OUTPUT"
kubectl get pods
Write-Output "--------------------------------------------------------------------"
echo "`n"

echo "Verify the services created"
echo "Run command: kubectl get services"
echo "`n"
echo "OUTPUT"
kubectl get services
Write-Output "--------------------------------------------------------------------"
echo "`n"

echo "Apply cluster role binding to authorize viewing of components of AKS cluster created"
echo "Run command: kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard"
echo "`n"
echo "OUTPUT"
kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard
Write-Output "--------------------------------------------------------------------"
echo "`n"


echo "Browse the dashboard of AKS cluster"
echo "Run command: az aks browse --resource-group RGaksmustafa --name CLUSTERaksmustafa"
echo "`n"
echo "OUTPUT"
az aks browse --resource-group RGaksmustafa --name CLUSTERaksmustafa
Write-Output "--------------------------------------------------------------------"
echo "`n"
