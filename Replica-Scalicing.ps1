echo "Scaling of pods started"
echo "Run command: kubectl scale --replicas=5 deployment/aks"
echo "`n"
echo "OUTPUT"
kubectl scale --replicas=5 deployment/aks
Write-Output "--------------------------------------------------------------------"
echo "`n"