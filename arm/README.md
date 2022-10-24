# Define Azure Resources using ARM templates

## Validate the deployment files

az deployment group validate \
--resource-group MyResourceGroup \
--template-file mydeploymentTemplate.json \
--parameters @mydeploymentParameters.json

## Review the deployment without deploying

az deployment group what-if \
--name MyDeployment \
--resource-group MyResourceGroup \
--template-file mydeploymentTemplate.json \
--parameters @mydeploymentParameters.json

az group delete --name rghellojo002dev
