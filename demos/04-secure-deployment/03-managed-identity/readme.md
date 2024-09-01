# Using Managed Idenity

- Explain Managed Identity Basics in Short
- Explain and execute: `create-api-mi.azcli`
- Give a brief overview over `food-app/apps/catalog-api/api/appsettings.json`

    ```json
    "App": {
        "AuthEnabled": false,
        "UseSQLite": true,
        "UseAppConfig": false,
        "ConnectionStrings": {
            "SQLiteDBConnection": "Data Source=./food.db",
            "SQLServerConnection": "Data Source=localhost;Initial Catalog=food-db;Persist Security Info=True;User ID=sa;Password='TiTp4SQL@dmin'"
        }
    },
    "FeatureManagement":{
        "PublishEvents" : false,
        "UseKeyVaultWithMI" : true,
        "UseAppConfiguration" : false,
        "UseHealthChecks" : false,
        "UseApplicationInsights" : false
    },
    ```

- Explain `food-app/apps/catalog-api/api/Startup.cs` and the use of Microsoft.Azure.Services.AppAuthentication

    ```c#
    if (cfg.App.UseSQLite)
    {
        string dbconstring = cfg.App.ConnectionStrings.SQLiteDBConnection;

        if(cfg.FeatureManagement.UseKeyVaultWithMI)
        {
            var azureServiceTokenProvider = new AzureServiceTokenProvider();
            var kvClient = new KeyVaultClient(new KeyVaultClient.AuthenticationCallback(azureServiceTokenProvider.KeyVaultTokenCallback));            
            dbconstring = (kvClient.GetSecretAsync(cfg.Azure.KeyVault, "conSQLite").Result).Value;
            Console.WriteLine($"Using SQLLite with connection string from KeyVault: {cfg.Azure.KeyVault}");                                
        }
        else
        {
            Console.WriteLine($"Using SQLite with connection string: {dbconstring}");                   
        }

        services.AddDbContext<FoodDBContext>(options => options.UseSqlite(dbconstring));
    }
    ```
- Import and execute `catalog-api-cicd-mi.yml`. Point out the config change in appsettings.json of the catalog-api.