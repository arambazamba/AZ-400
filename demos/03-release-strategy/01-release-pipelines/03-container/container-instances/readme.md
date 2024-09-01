# Build Angular UI and Deploy to ACI using pipeline


- Explain credentials from ACI:

    ![admin-usr](_images/admin-usr.png)

- Explain az-cli/create-container-instance-sh from [food-app]()

    ```bash
    grp=az400-m03-container
    loc=westeurope
    app=food-catalog-api-aci
    img=$2
    dns=$3
    usr=$4
    pwd=$5

    az group create -n $grp -l $loc
    az container create -g $grp -l $loc -n $app --image $img --cpu 1 --memory 1 --dns-name-label $dns --port 80 --registry-username $usr --registry-password $pwd --registry-login-server foodacrcontainer.azurecr.io
    ```

Explain [catalog-cd-aci.yml](https://github.com/arambazamba/food-app/blob/master/deploy/az-pipelines/catalog-cd-aci.yml)
