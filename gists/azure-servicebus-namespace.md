# Azure Service Bus Namespace

> **Info**
> Please checkout the Microsoft tutorial - https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-quickstart-cli

CREATE RESOURCE GROUP

> **Warning**
> Resource names may not have spaces. Recommend not using any dashes or special characters in the resource name.

If the resource group is not already created, use the following to create the resource group.

```shell
az group create --name rgbeskardev --location centralus
```

### Azure Region Names

Locate the name of the desired region from the table and set the location value in the command above.
| Display Name | Name | Regional Display Name |
| ---------------- | -------------- | ---------------------------- |
| East US | eastus | (US) East US |
| East US 2 | eastus2 | (US) East US 2 |
| North Central US | northcentralus | (US) North Central US |
| South Central US | southcentralus | (US) South Central US |
| West US | westus | (US) West US |
| West US 2 | westus2 | (US) West US 2 |
| West US 3 | westus3 | (US) West US 3 |
| Central US | centralus | (US) Central US |
| Central India | centralindia | (Asia Pacific) Central India |
| South India | southindia | (Asia Pacific) South India |
| West India | westindia | (Asia Pacific) West India |

CREATE AZURE SERVICE BUS NAMESPACE

```shell
az servicebus namespace create --resource-group rgbeskardev --name nsbeskardev --location centralus
```

CREATE QUEUE IN NAMESPACE

```shell
az servicebus queue create --resource-group rgbeskardev --namespace-name nsbeskardev --name SubmitTaskQueue
```

GET THE PRIMARY CONNECTION STRING FOR NAMESPACE

```shell
az servicebus namespace authorization-rule keys list --resource-group rgbeskardev --namespace-name nsbeskardev --name RootManageSharedAccessKey --query primaryConnectionString --output tsv
```
