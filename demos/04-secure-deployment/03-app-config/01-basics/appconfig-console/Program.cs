using System;
using Azure.Identity;
using Microsoft.Extensions.Configuration;

namespace AppConfigConsole
{
    class Program
    {
        static void Main(string[] args)
        {
            var builder = new ConfigurationBuilder();
            var cs = "Endpoint=https://foodconfig-11246.azconfig.io;Id=W68L-l9-s0:ktNReCiDB25NLCFZnZ1j;Secret=Xc1Zr47AdLlzLwOyn9R6Aha0sr4v/+YMhf7+eCBKZWY=";

                builder.AddAzureAppConfiguration(options =>
                {
                    options.Connect(cs)
                            .ConfigureKeyVault(kv =>
                            {
                                kv.SetCredential(new DefaultAzureCredential());
                            });
                });

                var config = builder.Build();
                Console.WriteLine(config["App:Title"] ?? "No Title received");
                Console.WriteLine(config["App:ConnectionString:SQLiteDBConnection"] ?? "No ConString received");
                Console.WriteLine(config[".appconfig.featureflag/UseKeyVaultWithMI"] ?? "No ConString received");
        }
    }
}