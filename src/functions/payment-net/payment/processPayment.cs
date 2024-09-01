using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace Company.Function
{
    public class processPayment
    {
        private readonly ILogger<processPayment> _logger;

        public processPayment(ILogger<processPayment> logger)
        {
            _logger = logger;
        }

        [Function("processPayment")]
        public async Task<IActionResult> ProcessPayment([HttpTrigger(AuthorizationLevel.Anonymous, "post")] HttpRequest req)
        {
            _logger.LogInformation("C# HTTP trigger function processed a request.");
             Payment payment = new Payment();
            
            string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
                          
            return new OkObjectResult($"Response from processPayment: {requestBody}");
        }
    }
}
