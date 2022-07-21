az login

az account set --subscription Kulbajj_Subscription

# Create a resource group
az group create --name rgbeskardev --location centralus

# Create a Messaging namespace
az servicebus namespace create --name nsbeskardev --resource-group rgbeskardev -l centralus

# Create a queue
az servicebus queue create --resource-group rgbeskardev --namespace-name nsbeskardev --name SubmitTaskQueue

# Get the connection string
az servicebus namespace authorization-rule keys list --resource-group rgbeskardev --namespace-name nsbeskardev --name RootManageSharedAccessKey

# Delete the created resources if desired
# az group delete --resource-group rgbeskardev