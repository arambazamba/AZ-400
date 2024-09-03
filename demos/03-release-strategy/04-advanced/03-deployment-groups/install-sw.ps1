Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Get-WindowsOptionalFeature -Online | where FeatureName -like 'IIS-*'

choco install dotnet-6.0-runtime -y
choco install dotnet-6.0-windowshosting -y

Restart-Computer -ComputerName localhost -Force