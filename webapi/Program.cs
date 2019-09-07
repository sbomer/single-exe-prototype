using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace webapi
{
    public class Program
    {
        public static async Task Main(string[] args)
        {
            // Stopwatch stopWatch = new Stopwatch();
            // stopWatch.Start();
            // using (var host = CreateHostBuilder(args).Start())
            // {
            //     var client = new HttpClient();
            //     var response = await client.GetAsync("http://localhost:5000/WeatherForecast");
            //     response.EnsureSuccessStatusCode();
            //     stopWatch.Stop();
            //     TimeSpan ts = stopWatch.Elapsed;
            //     Console.WriteLine("STARTUP TIME: " + ts.Milliseconds);
            // }

            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                })
                .ConfigureLogging(loggingBuilder =>
                                  // Don't perturb the measurement with log spew for every request
                                  // This can't be set in the settings file for the single executable
                                  loggingBuilder.SetMinimumLevel(LogLevel.Error)
                                  // But keep logging for app startp/shutdown
                                  .AddFilter("Microsoft.Hosting.Lifetime", LogLevel.Information));
    }
}
