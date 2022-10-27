param location string = 'westus'
// resource learndevwestusasp 'Microsoft.Web/serverfarms@2020-12-01' = {
//   name: 'learn-dev-westus-asp'
//   location: location
//   sku: {
//     name: 's1'
//     capacity: 1
//   }
// }

resource learndevwestusasp2 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'learn-dev-westus-linux-asp'
  kind: 'linux'
  properties: {
    reserved: true
  }
  location: location
  sku: {
    name: 's1'
    capacity: 1
  }
}

resource learndevwestusas 'Microsoft.Web/sites@2021-01-15' = {
  name: 'learn-dev-westus-webapp1'
  location: location

  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms', 'learn-dev-westus-linux-asp')
  }
  dependsOn: [
    learndevwestusasp2
  ]
}

resource learndevwestusai 'Microsoft.Insights/components@2020-02-02' = {
  name: 'learn-dev-westus-webapp1-ai'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Request_Source: 'rest'
  }
}
