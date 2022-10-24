## Create a new Azure resource group
resourcegroup=rghappy003dev
az group create --name $resourcegroup --location westus

## Validate deployment and parameters
az deployment group validate \
--resource-group $resourcegroup \
--template-file 01-storage-account.json \
--parameters @01-storage-account.parameters.json

## Review the deployment without deploying
az deployment group what-if \
--name HappyDeployment \
--resource-group $resourcegroup \
--template-file 01-storage-account.json \
--parameters @01-storage-account.parameters.json
