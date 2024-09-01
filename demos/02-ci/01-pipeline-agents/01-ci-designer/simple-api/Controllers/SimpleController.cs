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
}