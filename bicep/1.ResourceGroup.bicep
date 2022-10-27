targetScope = 'subscription'

param location string = 'westus'
// param location string
resource learndevwestusrg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'learn-dev-${location}-rg'
  location: location
}
