# Commands used to execute BICEP templates

## Pre-requisites

- az cli
- bicep cli

## Simple deployment of Hello World

The following command assumes that a Azure Resource Group has been created in advance. In this case, I have created a Resource Group named 'learn-dev-westus-rg'.

In order to execute the following commands, the Azure CLI must be installed on your local machine.

```shell
az deployment group create --resource-group learn-dev-westus-rg --template-file biceptemplate.bicep
```

OR

```shell
az deployment group create --resource-group learn-dev-westus-rg --template-file armtemplate.json
```

The same command is used with both the BICEP template and the ARM template.

## Create Resource Group

BICEP Template

```bicep
targetScope = 'subscription'

param location string = 'westus'
resource learndevwestusrg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'learn-dev-${location}-rg'
  location: location
}
```

Command

```shell
az deployment sub create -l westus -f 1.ResourceGroup.bicep
```
