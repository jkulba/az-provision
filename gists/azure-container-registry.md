---
title: Azure Container Registry
description: Azure Container Registry.
author: jim.kulba
topic: article
date: 07/21/2022
---

# Azure Container Registry

Taken from Microsoft tutorial on how to create a container image and deploy to Azure Container Registry.

https://docs.microsoft.com/en-us/azure/container-instances/container-instances-tutorial-prepare-app

CREATE RESOURCE GROUP

```shell
az group create --name rgbeskardev --location centralus
```

```json
{
  "id": "/subscriptions/85aee6d8-25f2-42c3-b3bc-a04a444e1a75/resourceGroups/rgbeskardev",
  "location": "centralus",
  "managedBy": null,
  "name": "rgbeskardev",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null,
  "type": "Microsoft.Resources/resourceGroups"
}
```

https://docs.microsoft.com/en-us/azure/container-instances/container-instances-tutorial-prepare-acr

CREATE AZURE CONTAINER REGISTRY

```shell
az acr create --resource-group rgbeskardev --name acrbeskardev --sku Basic
```

```json
{
  "adminUserEnabled": false,
  "anonymousPullEnabled": false,
  "creationDate": "2022-07-20T22:58:30.774785+00:00",
  "dataEndpointEnabled": false,
  "dataEndpointHostNames": [],
  "encryption": {
    "keyVaultProperties": null,
    "status": "disabled"
  },
  "id": "/subscriptions/85aee6d8-25f2-42c3-b3bc-a04a444e1a75/resourceGroups/rgbeskardev/providers/Microsoft.ContainerRegistry/registries/acrbeskardev",
  "identity": null,
  "location": "centralus",
  "loginServer": "acrbeskardev.azurecr.io",
  "name": "acrbeskardev",
  "networkRuleBypassOptions": "AzureServices",
  "networkRuleSet": null,
  "policies": {
    "exportPolicy": {
      "status": "enabled"
    },
    "quarantinePolicy": {
      "status": "disabled"
    },
    "retentionPolicy": {
      "days": 7,
      "lastUpdatedTime": "2022-07-20T22:58:32.078558+00:00",
      "status": "disabled"
    },
    "trustPolicy": {
      "status": "disabled",
      "type": "Notary"
    }
  },
  "privateEndpointConnections": [],
  "provisioningState": "Succeeded",
  "publicNetworkAccess": "Enabled",
  "resourceGroup": "rgbeskardev",
  "sku": {
    "name": "Basic",
    "tier": "Basic"
  },
  "status": null,
  "systemData": {
    "createdAt": "2022-07-20T22:58:30.774785+00:00",
    "createdBy": "kulbajj@outlook.com",
    "createdByType": "User",
    "lastModifiedAt": "2022-07-20T22:58:30.774785+00:00",
    "lastModifiedBy": "kulbajj@outlook.com",
    "lastModifiedByType": "User"
  },
  "tags": {},
  "type": "Microsoft.ContainerRegistry/registries",
  "zoneRedundancy": "Disabled"
}
```

LOG IN

```shell
az acr login --name acrbeskardev
```

```shell
az acr show --name acrbeskardev --query loginServer --output table
```

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
