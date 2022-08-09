$rg = 'maxwellresourcegroup'
New-AzResourceGroup -Name $rg -Location westus2 -Force

New-AzResourceGroupDeployment
  -Name 'maxwelldevdeployment'
  -AzResourceGroupName $rg
  -TemplateFile '01-storage-account.json'
  