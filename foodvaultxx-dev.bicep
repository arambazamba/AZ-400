resource foodvaultxx_dev 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: 'foodvaultxx-dev'
  location: 'westeurope'
  tags: {}
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: 'd92b247e-90e0-4469-a129-6a32866c0d0a'
    accessPolicies: []
    enabledForDeployment: false
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    enableRbacAuthorization: true
    vaultUri: 'https://foodvaultxx-dev.vault.azure.net/'
    provisioningState: 'Succeeded'
  }
}
