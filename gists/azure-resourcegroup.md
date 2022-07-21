---
title: Azure Resource Group
description: Azure Resource Group.
author: jim.kulba
topic: article
date: 07/21/2022
---

# Azure Resource Group

CREATE RESOURCE GROUP

> **Note**
> Resource names may not have spaces. Recommend not using any dashes or special characters in the resource name.

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
