# Database DevOps

## Links & Resources

[Azure SQL database deployment](https://learn.microsoft.com/en-us/azure/devops/pipelines/targets/azure-sqldb?view=azure-devops&tabs=yaml)

[DataOps for the modern data warehouse](https://docs.microsoft.com/en-us/azure/architecture/example-scenario/data-warehouse/dataops-mdw)

## Demo

- Examine the use of a SQL Server database in [/src/services/catalog-service](/src/services/catalog-service/Program.cs):

    ```csharp
    if (cfg.App.UseSQLite)
    {
        builder.Services.AddDbContext<FoodDBContext>(
            options => options.UseSqlite(cfg.App.ConnectionStrings.SQLiteDBConnection)
        );
    }
    else
    {
        builder.Services.AddDbContext<FoodDBContext>(
            opts => opts.UseSqlServer(cfg.App.ConnectionStrings.SQLServerConnection)
        );
    }
    ```

- Database Deployment Options:

    - State based DB Deployment - DACPAC
    - Change based DB Deployment - ie Entity Framework Core Migrations
