# Pipeline using Bicep Deployment

## Demo

- Create resource group:

```bash
az group create --name az400-m06-bicep --location westeurope
```

- Preview changes

```bash
az deployment group what-if --resource-group az400-m06-bicep \
   --template-file webapp-windows.bicep \
   --parameters webAppName='bicep-site'
```

- Deploy the web app using Bicep

```bash
az deployment group create --resource-group az400-m06-bicep \
   --template-file webapp-windows.bicep \
   --parameters webAppName='bicep-site'
```

