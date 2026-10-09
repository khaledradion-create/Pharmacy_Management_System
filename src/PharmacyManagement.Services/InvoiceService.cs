using Microsoft.EntityFrameworkCore;
using PharmacyManagement.Core.Entities;
using PharmacyManagement.Data;

namespace PharmacyManagement.Services;

public class DashboardSummaryDto
{
    public decimal TotalRevenue { get; set; }
    public int TotalInvoices { get; set; }
    public int ProductsLowStock { get; set; }
    public int ActiveCustomers { get; set; }
    public decimal TodayRevenue { get; set; }
    public List<TopSellingMedicineDto> TopSellingMedicines { get; set; } = new();
}

public class TopSellingMedicineDto
{
    public int MedicineId { get; set; }
    public string MedicineName { get; set; } = string.Empty;
    public int QuantitySold { get; set; }
    public decimal Revenue { get; set; }
}

public class DashboardService
{
    private readonly AppDbContext _context;

    public DashboardService(AppDbContext context)
    {
        _context = context;
    }

    public async Task<DashboardSummaryDto> GetSummaryAsync()
    {
        var today = DateTime.UtcNow.Date;

        var totalRevenue = await _context.Invoices
            .Where(i => i.NetAmount > 0)
            .SumAsync(i => (decimal?)i.NetAmount) ?? 0m;

        var totalInvoices = await _context.Invoices.CountAsync();
        var activeCustomers = await _context.Customers.CountAsync(c => c.IsActive);
        var lowStock = await _context.Medicines.CountAsync(m => m.CurrentStock <= m.MinimumStock && m.IsActive);

        var todayRevenue = await _context.Invoices
            .Where(i => i.InvoiceDate.Date == today)
            .SumAsync(i => (decimal?)i.NetAmount) ?? 0m;

        var topSellingMedicines = await _context.InvoiceItems
            .GroupBy(ii => new { ii.MedicineId, ii.Medicine.MedicineName })
            .Select(g => new TopSellingMedicineDto
            {
                MedicineId = g.Key.MedicineId,
                MedicineName = g.Key.MedicineName,
                QuantitySold = g.Sum(x => x.Quantity),
                Revenue = g.Sum(x => x.LineTotal)
            })
            .OrderByDescending(x => x.QuantitySold)
            .Take(5)
            .ToListAsync();

        return new DashboardSummaryDto
        {
            TotalRevenue = totalRevenue,
            TotalInvoices = totalInvoices,
            ProductsLowStock = lowStock,
            ActiveCustomers = activeCustomers,
            TodayRevenue = todayRevenue,
            TopSellingMedicines = topSellingMedicines
        };
    }

    public async Task<List<Medicine>> GetLowStockAsync()
    {
        return await _context.Medicines
            .Include(m => m.Supplier)
            .Where(m => m.CurrentStock <= m.MinimumStock && m.IsActive)
            .OrderBy(m => m.CurrentStock)
            .ToListAsync();
    }
}
