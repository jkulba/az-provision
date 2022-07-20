# Azure Container Registry

Taken from Microsoft tutorial on how to create a container image and deploy to Azure Container Registry.

https://docs.microsoft.com/en-us/azure/container-instances/container-instances-tutorial-prepare-app

CREATE RESOURCE GROUP

```shell
az group create --name rgbeskardev --location centralus
```

https://docs.microsoft.com/en-us/azure/container-instances/container-instances-tutorial-prepare-acr

CREATE AZURE CONTAINER REGISTRY

```shell
az acr create --resource-group rgbeskardev --name acrbeskardev --sku Basic
```

LOG IN

```shell
az acr login --name acrbeskardev
```

```shell
az acr show --name acrbeskardev --query loginServer --output table
```

## Result

acrbeskardev.azurecr.io

TAG IMAGE

```shell
docker tag aci-tutorial-app acrbeskardev.azurecr.io/aci-tutorial-app:v1
```

PUSH to ACR

```shell
docker push acrbeskardev.azurecr.io/aci-tutorial-app:v1
```

LIST IMAGES in ACR

```shell
az acr repository list --name acrbeskardev --output table
```

LIST IMAGES in ACR WITH TAGS

```shell
az acr repository show-tags --name acrbeskardev --repository aci-tutorial-app --output table
```

```shell
az acr show --name acrbeskardev --query loginServer
```

acrbeskardev.azurecr.io

DEPLOY CONTAINER

> **Note**
> The following command requires the registry username and password that are unique to the Azure account. That means that the following command wont work for anyone else.

```shell
az container create --resource-group rgbeskardev --name aci-tutorial-app --image acrbeskardev.azurecr.io/aci-tutorial-app:v1 --cpu 1 --memory 1 --registry-login-server acrbeskardev.azurecr.io --registry-username bd3036be-85e7-48be-b396 --registry-password OBg8Q~Ry.kwLfBsBM6SPXfyaddh --ip-address Public --dns-name-label beskardns --ports 80
```

VERIFY DEPLOYMENT PROGRESS

```shell
az container show --resource-group rg-bucket-dev --name aci-tutorial-app --query instanceView.state
```

VIEW APPLICATION AND CONTAINER LOGS

```shell
az container show --resource-group rg-bucket-dev --name aci-tutorial-app --query ipAddress.fqdn
```
