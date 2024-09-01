# .NET Core Build

[Build Tasks](https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/?view=azure-devops)

## Demo

- Requires [.NET 6 SDK](https://dotnet.microsoft.com/download/dotnet/6.0)
- Show Build pipeline with designer and yaml
- Show simple release just to prove that is works

Create a .NET Core Api outside of this repo:

```
dotnet new webapi -n simple-api
```

Delete unused files:

```
WeatherForecast.cs
WeatherForecastController.cs
```

Create `SimpleController.cs`:

```c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace SimpleApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SimpleController : ControllerBase
    {
        public SimpleController()
        {
        }

        [HttpGet("")]
        public ActionResult<IEnumerable<Data>> GetDatas()
        {
            return new List<Data> { new Data{Id=1, Name="Simple Data"} };
        }
    }

    public class Data{
        public int Id { get; set; }
        public string Name { get; set; }
    }
}


```

Test using:

```
dotnet watch run
```

- Create a new DevOps Project `AZ-400-M04-AzurePipelines`
- Get the default repo url - example: `https://dev.azure.com/<ORG>/AZ-400-M04-AzurePipelines/\_git/AZ-400-M04-AzurePipelines`
- Upload your proj to this repo
