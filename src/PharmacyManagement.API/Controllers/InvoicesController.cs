using Microsoft.AspNetCore.Mvc;
using PharmacyManagement.Services;

namespace PharmacyManagement.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class InvoicesController : ControllerBase
{
    private readonly InvoiceService _invoiceService;

    public InvoicesController(InvoiceService invoiceService)
    {
        _invoiceService = invoiceService;
    }

    [HttpGet]
    public async Task<ActionResult> GetAll()
    {
        var invoices = await _invoiceService.GetInvoicesAsync();
        return Ok(invoices);
    }

    [HttpPost]
    public async Task<ActionResult> Create([FromBody] CreateInvoiceRequest request)
    {
        try
        {
            var invoice = await _invoiceService.CreateInvoiceAsync(request);
            return Ok(invoice);
        }
        catch (Exception ex)
        {
            return BadRequest(new { message = ex.Message });
        }
    }
}
