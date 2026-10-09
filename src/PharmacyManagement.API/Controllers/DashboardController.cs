using Microsoft.AspNetCore.Mvc;
using PharmacyManagement.Services;

namespace PharmacyManagement.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class DashboardController : ControllerBase
{
    private readonly DashboardService _dashboardService;

    public DashboardController(DashboardService dashboardService)
    {
        _dashboardService = dashboardService;
    }

    [HttpGet("summary")]
    public async Task<ActionResult> GetSummary()
    {
        var summary = await _dashboardService.GetSummaryAsync();
        return Ok(summary);
    }

    [HttpGet("low-stock")]
    public async Task<ActionResult> GetLowStock()
    {
        var items = await _dashboardService.GetLowStockAsync();
        return Ok(items);
    }
}
