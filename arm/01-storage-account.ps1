$rg = 'maxwellresourcegroup'
New-AzResourceGroup -Name $rg -Location westus2 -Force

New-AzResourceGroupDeployment `
  -Name 'maxwelldevdeployment' `
  -ResourceGroupName $rg `
  -TemplateFile '01-storage-account.json' `
  -storageAccountName 'maxwellstorageaccount' `
  -storageSKU 'Standard_LRS'
  