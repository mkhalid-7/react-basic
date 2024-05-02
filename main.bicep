targetScope = 'subscription'
param location string 
param webAppName string
param runtimeStack string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'mkhalid-rg'
  location: location
}


module AppService 'appservice.bicep' = {
  scope: resourceGroup
  name: 'appservice_Module'
  params: {
     location: location
     webAppName: webAppName
     runtimeStack: runtimeStack
  }
}


