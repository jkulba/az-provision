$rg = 'snowmanresourcegroup'
New-AzResourceGroup -Name $rg -Location westus -Force

New-AzResourceGroupDeployment `
  -Name 'snowmandeployment' `
  -ResourceGroupName $rg `
  -TemplateFile '02-function-app.json' `
  