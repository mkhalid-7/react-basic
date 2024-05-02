// param location string 
// param AppName string
// param runtimeStack string

// var unique = substring('${uniqueString(resourceGroup().id)}', 0 , 3 ) 

// @description('App Service')
// var webAppName = 'mkhalid-${AppName}${unique}'
// var appServicePlanName  = 'mkhalid-${AppName}-plan-${unique}'
// var linuxFxVersion = runtimeStack   

param location string 
param webAppName string
param runtimeStack string

// 
@description('App Service')
var appServicePlanName  = '${webAppName}-plan'
var linuxFxVersion = runtimeStack   

@description('App Service Plan')
resource AppServicePlan 'Microsoft.Web/serverfarms@2023-01-01' = {
  name: appServicePlanName
  location: location
  kind: 'app'
  sku: {
    name: 'B1'
    tier: 'Basic'
    size: 'B1'
    family: 'B'
    capacity: 1
  }
  properties: {
    reserved: true
  }
}

// 


@description('App Service')
resource appService 'Microsoft.Web/sites@2023-01-01' = {
  name: webAppName
  location: location
  kind: 'app'
  properties: {
     serverFarmId: AppServicePlan.id
     siteConfig: {
       linuxFxVersion: linuxFxVersion
     }

  }
}









