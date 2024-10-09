# Install Software
winget install Google.Chrome
winget install Microsoft.VisualStudioCode
winget install Git.Git
winget install GitExtensionsTeam.GitExtensions
winget install GitHub.GitLFS
winget install GitTools.GitVersion
winget install Microsoft.DotNet.SDK.8
winget install OpenJS.NodeJS.LTS --version 20.12.2
winget install Microsoft.AzureCLI
winget install Microsoft.AzureFunctionsCoreTools --params "/x64:true"
winget install GitHub.cli
winget install curl.curl
winget install microsoft.azd

# Refresh Path Env for npm 
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Set NuGet Source
dotnet nuget add source https://api.nuget.org/v3/index.json -n nuget.org

# Intall VS Code Extensions
code --install-extension ms-dotnettools.csharp
code --install-extension ms-vscode.powershell
code --install-extension ms-vscode.azurecli
code --install-extension ms-vscode.azure-account
code --install-extension ms-azuretools.vscode-azureappservice
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-azuretools.vscode-azurefunctions
code --install-extension GitHub.vscode-pull-request-github
code --install-extension redhat.vscode-yaml
code --install-extension bencoleman.armview
code --install-extension mdickin.markdown-shortcuts
code --install-extension mhutchie.git-graph 
code --install-extension ms-azure-devops.azure-pipelines		
code --install-extension ms-azuretools.vscode-azureterraform
code --install-extension vs-publisher-1448185.keyoti-changeallendoflinesequence
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension msazurermtools.azurerm-vscode-tools
code --install-extension ms-azuretools.vscode-bicep
code --install-extension ms-azuretools.vscode-azurecontainerapps

# Azurite Storage Emulator
npm install -g azurite

# Install Angular
npm i -g @angular/cli

# Http-Server
npm i -g http-server

# Finished Msg
Write-Host "Finished Software installation" -ForegroundColor yellow
