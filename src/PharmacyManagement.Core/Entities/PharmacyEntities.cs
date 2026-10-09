using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PharmacyManagement.Core.Entities;

public class User
{
    [Key]
    public int UserId { get; set; }

    [Required, MaxLength(50)]
    public string Username { get; set; } = string.Empty;

    [Required, MaxLength(255)]
    public string PasswordHash { get; set; } = string.Empty;

    [MaxLength(100)]
    public string? Email { get; set; }

    [MaxLength(100)]
    public string? FullName { get; set; }

    [MaxLength(20)]
    public string Role { get; set; } = "Admin";

    public bool IsActive { get; set; } = true;
    public DateTime CreatedDate { get; set; } = DateTime.UtcNow;
    public DateTime? LastLogin { get; set; }
}

public class Customer
{
    [Key]
    public int CustomerId { get; set; }

    [Required, MaxLength(100)]
    public string CustomerName { get; set; } = string.Empty;

    [MaxLength(20)]
    public string? PhoneNumber { get; set; }

    [MaxLength(100)]
    public string? Email { get; set; }

    [MaxLength(255)]
    public string? Address { get; set; }

    [MaxLength(50)]
    public string? City { get; set; }

    [MaxLength(50)]
    public string? Country { get; set; }

    [MaxLength(20)]
    public string CustomerType { get; set; } = "Individual";

    public bool IsActive { get; set; } = true;
    public DateTime CreatedDate { get; set; } = DateTime.UtcNow;
    public DateTime? LastPurchaseDate { get; set; }

    public ICollection<Invoice> Invoices { get; set; } = new List<Invoice>();
}

public class Supplier
{
    [Key]
    public int SupplierId { get; set; }

    [Required, MaxLength(100)]
    public string SupplierName { get; set; } = string.Empty;

    [MaxLength(100)]
    public string? ContactPerson { get; set; }

    [MaxLength(20)]
    public string? PhoneNumber { get; set; }

    [MaxLength(100)]
    public string? Email { get; set; }

    [MaxLength(255)]
    public string? Address { get; set; }

    [MaxLength(50)]
    public string? City { get; set; }

    [MaxLength(50)]
    public string? Country { get; set; }

    [MaxLength(50)]
    public string SupplierType { get; set; } = "Distributor";

    [MaxLength(50)]
    public string? TaxNumber { get; set; }

    public int? PaymentTerms { get; set; }
    public bool IsActive { get; set; } = true;
    public DateTime CreatedDate { get; set; } = DateTime.UtcNow;

    public ICollection<Medicine> Medicines { get; set; } = new List<Medicine>();
}

public class Employee
{
    [Key]
    public int EmployeeId { get; set; }

    [Required, MaxLength(100)]
    public string EmployeeName { get; set; } = string.Empty;

    [MaxLength(50)]
    public string? Position { get; set; }

    [MaxLength(20)]
    public string? PhoneNumber { get; set; }

    [MaxLength(100)]
    public string? Email { get; set; }

    [MaxLength(255)]
    public string? Address { get; set; }

    public DateTime? DateOfBirth { get; set; }
    public DateTime? JoinDate { get; set; }
    public decimal Salary { get; set; }

    [MaxLength(50)]
    public string? Department { get; set; }

    public bool IsActive { get; set; } = true;
    public DateTime CreatedDate { get; set; } = DateTime.UtcNow;

    public ICollection<Invoice> Invoices { get; set; } = new List<Invoice>();
}

public class Medicine
{
    [Key]
    public int MedicineId { get; set; }

    [Required, MaxLength(150)]
    public string MedicineName { get; set; } = string.Empty;

    [MaxLength(150)]
    public string? GenericName { get; set; }

    [MaxLength(100)]
    public string? Manufacturer { get; set; }

    public int SupplierId { get; set; }
    [ForeignKey(nameof(SupplierId))]
    public Supplier Supplier { get; set; } = new Supplier();

    [MaxLength(50)]
    public string? Strength { get; set; }

    [MaxLength(20)]
    public string? UnitType { get; set; }

    public decimal CostPrice { get; set; }
    public decimal SellingPrice { get; set; }
    public int CurrentStock { get; set; }
    public int MinimumStock { get; set; }
    public int MaximumStock { get; set; }
    public DateTime? ExpiryDate { get; set; }

    [MaxLength(50)]
    public string? BatchNumber { get; set; }

    [MaxLength(50)]
    public string? Barcode { get; set; }

    [MaxLength(500)]
    public string? Description { get; set; }

    public bool IsActive { get; set; } = true;
    public DateTime CreatedDate { get; set; } = DateTime.UtcNow;
    public DateTime ModifiedDate { get; set; } = DateTime.UtcNow;

    public ICollection<InvoiceItem> InvoiceItems { get; set; } = new List<InvoiceItem>();
}

public class Invoice
{
    [Key]
    public int InvoiceId { get; set; }

    [Required, MaxLength(50)]
    public string InvoiceNumber { get; set; } = string.Empty;

    public int CustomerId { get; set; }
    [ForeignKey(nameof(CustomerId))]
    public Customer Customer { get; set; } = new Customer();

    public int? CashierId { get; set; }
    [ForeignKey(nameof(CashierId))]
    public Employee? Cashier { get; set; }

    public DateTime InvoiceDate { get; set; } = DateTime.UtcNow;
    public decimal TotalAmount { get; set; }
    public decimal Discount { get; set; }
    public decimal TaxAmount { get; set; }
    public decimal NetAmount { get; set; }

    [MaxLength(20)]
    public string PaymentMethod { get; set; } = "Cash";

    [MaxLength(20)]
    public string PaymentStatus { get; set; } = "Paid";

    [MaxLength(500)]
    public string? Notes { get; set; }

    public DateTime CreatedDate { get; set; } = DateTime.UtcNow;

    public ICollection<InvoiceItem> InvoiceItems { get; set; } = new List<InvoiceItem>();
}

public class InvoiceItem
{
    [Key]
    public int InvoiceItemId { get; set; }

    public int InvoiceId { get; set; }
    [ForeignKey(nameof(InvoiceId))]
    public Invoice Invoice { get; set; } = new Invoice();

    public int MedicineId { get; set; }
    [ForeignKey(nameof(MedicineId))]
    public Medicine Medicine { get; set; } = new Medicine();

    public int Quantity { get; set; }
    public decimal UnitPrice { get; set; }
    public decimal LineTotal { get; set; }
    public DateTime? ExpiryDate { get; set; }

    [MaxLength(255)]
    public string? Notes { get; set; }

    public DateTime CreatedDate { get; set; } = DateTime.UtcNow;
}

public enum UserRole
{
    Admin,
    Manager,
    Cashier,
    Pharmacist
}

public enum PaymentMethod
{
    Cash,
    Card,
    Check,
    Credit
}

public enum PaymentStatus
{
    Paid,
    Pending,
    Partial
}
