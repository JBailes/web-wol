using System.Net;
using Microsoft.AspNetCore.Mvc.Testing;

namespace WolWeb.Tests.Host;

public class HealthCheckTests
{
    [Fact]
    public async Task HealthEndpoint_Returns200()
    {
        await using var factory = new WebApplicationFactory<Program>();
        var client = factory.CreateClient();

        var response = await client.GetAsync("/health");

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
    }
}
