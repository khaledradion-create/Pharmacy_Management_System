# تصميم قاعدة البيانات - Database Design

## مخطط الكائنات (ER Diagram)

```
┌────────────┐
│   Users    │
├────────────┤
│ UserID (PK)│
│ Username   │
│ Email      │
│ Role       │
│ IsActive   │
└────────────┘

┌───────────────┐         ┌────────────────┐
│  Customers    │────────→│  Invoices      │
├───────────────┤         ├────────────────┤
│ CustomerID(PK)│         │ InvoiceID (PK) │
│ CustomerName  │         │ CustomerID(FK) │
│ PhoneNumber   │         │ InvoiceDate    │
│ Email         │         │ TotalAmount    │
│ Address       │         │ NetAmount      │
│ City          │         └────────────────┘
│ Country       │                │
│ CustomerType  │                │
│ IsActive      │                │
└───────────────┘                │
                         ┌────────▼──────────────┐
                         │  Invoice_Items        │
                         ├───────────────────────┤
                         │ InvoiceItemID (PK)    │
                         │ InvoiceID (FK)        │
                         │ MedicineID (FK)       │
                         │ Quantity              │
                         │ UnitPrice             │
                         │ LineTotal             │
                         └───────────────────────┘
                                    │
                                    │ References
                                    ▼
┌───────────────┐         ┌────────────────┐
│   Suppliers   │────────→│  Medicines     │
├───────────────┤         ├────────────────┤
│ SupplierID(PK)│         │ MedicineID(PK) │
│ SupplierName  │         │ MedicineName   │
│ ContactPerson │         │ GenericName    │
│ PhoneNumber   │         │ Manufacturer   │
│ Email         │         │ SupplierID(FK) │
│ Address       │         │ Strength       │
│ City          │         │ UnitType       │
│ SupplierType  │         │ CostPrice      │
│ TaxNumber     │         │ SellingPrice   │
│ IsActive      │         │ CurrentStock   │
└───────────────┘         │ MinimumStock   │
                          │ ExpiryDate     │
                          │ BatchNumber    │
                          │ Barcode        │
                          │ IsActive       │
                          └────────────────┘

┌───────────────┐
│  Employees    │
├───────────────┤
│ EmployeeID(PK)│
│ EmployeeName  │
│ Position      │
│ PhoneNumber   │
│ Email         │
│ Department    │
│ JoinDate      │
│ Salary        │
│ IsActive      │
└───────────────┘
```

## وصف الجداول

### 1. جدول Users
**الغرض**: تخزين بيانات المستخدمين والموظفين الذين يستخدمون النظام

| الحقل | النوع | الوصف |
|-------|-------|-------|
| UserID | NUMBER | معرف فريد للمستخدم |
| Username | VARCHAR2(50) | اسم المستخدم الفريد |
| PasswordHash | VARCHAR2(255) | كلمة المرور المشفرة |
| Email | VARCHAR2(100) | البريد الإلكتروني |
| FullName | VARCHAR2(100) | الاسم الكامل |
| Role | VARCHAR2(20) | دور المستخدم (Admin, Manager, Cashier, Pharmacist) |
| IsActive | NUMBER(1) | 1 = نشط، 0 = معطل |
| CreatedDate | TIMESTAMP | تاريخ الإنشاء |
| LastLogin | TIMESTAMP | آخر تسجيل دخول |

### 2. جدول Customers
**الغرض**: تخزين بيانات العملاء (أفراد ومؤسسات)

| الحقل | النوع | الوصف |
|-------|-------|-------|
| CustomerID | NUMBER | معرف فريد للعميل |
| CustomerName | VARCHAR2(100) | اسم العميل |
| PhoneNumber | VARCHAR2(20) | رقم الهاتف |
| Email | VARCHAR2(100) | البريد الإلكتروني |
| Address | VARCHAR2(255) | العنوان |
| City | VARCHAR2(50) | المدينة |
| Country | VARCHAR2(50) | الدولة |
| CustomerType | VARCHAR2(20) | نوع العميل (Individual, Corporate) |
| IsActive | NUMBER(1) | حالة العميل |
| LastPurchaseDate | TIMESTAMP | آخر تاريخ شراء |

### 3. جدول Suppliers
**الغرض**: تخزين بيانات الموردين

| الحقل | النوع | الوصف |
|-------|-------|-------|
| SupplierID | NUMBER | معرف فريد للمورد |
| SupplierName | VARCHAR2(100) | اسم المورد |
| ContactPerson | VARCHAR2(100) | جهة الاتصال |
| PhoneNumber | VARCHAR2(20) | رقم الهاتف |
| Email | VARCHAR2(100) | البريد الإلكتروني |
| SupplierType | VARCHAR2(50) | نوع المورد (Manufacturer, Distributor, Wholesaler) |
| TaxNumber | VARCHAR2(50) | الرقم الضريبي |
| PaymentTerms | NUMBER | شروط الدفع (عدد الأيام) |
| IsActive | NUMBER(1) | حالة المورد |

### 4. جدول Medicines
**الغرض**: تخزين بيانات الأدوية والمنتجات الصيدلانية

| الحقل | النوع | الوصف |
|-------|-------|-------|
| MedicineID | NUMBER | معرف فريد للدواء |
| MedicineName | VARCHAR2(150) | اسم الدواء |
| GenericName | VARCHAR2(150) | الاسم العام (المادة الفعالة) |
| Manufacturer | VARCHAR2(100) | المصنع |
| SupplierID | NUMBER | معرف المورد |
| Strength | VARCHAR2(50) | قوة الدواء (مثل 500mg) |
| UnitType | VARCHAR2(20) | نوع الوحدة (tablet, capsule, liquid, injection) |
| CostPrice | NUMBER(10,2) | سعر التكلفة |
| SellingPrice | NUMBER(10,2) | سعر البيع |
| CurrentStock | NUMBER | الكمية المتاحة |
| MinimumStock | NUMBER | الحد الأدنى للمخزون |
| MaximumStock | NUMBER | الحد الأقصى للمخزون |
| ExpiryDate | DATE | تاريخ انتهاء الصلاحية |
| BatchNumber | VARCHAR2(50) | رقم الدفعة |
| Barcode | VARCHAR2(50) | الباركود |
| IsActive | NUMBER(1) | حالة الدواء |

### 5. جدول Invoices
**الغرض**: تخزين بيانات الفواتير

| الحقل | النوع | الوصف |
|-------|-------|-------|
| InvoiceID | NUMBER | معرف فريد للفاتورة |
| InvoiceNumber | VARCHAR2(50) | رقم الفاتورة الفريد |
| CustomerID | NUMBER | معرف العميل |
| CashierID | NUMBER | معرف الموظف (الكاشير) |
| InvoiceDate | TIMESTAMP | تاريخ الفاتورة |
| TotalAmount | NUMBER(12,2) | الإجمالي قبل الخصم والضريبة |
| Discount | NUMBER(10,2) | مبلغ الخصم |
| TaxAmount | NUMBER(10,2) | مبلغ الضريبة |
| NetAmount | NUMBER(12,2) | الإجمالي النهائي |
| PaymentMethod | VARCHAR2(20) | طريقة الدفع (Cash, Card, Check, Credit) |
| PaymentStatus | VARCHAR2(20) | حالة الدفع (Paid, Pending, Partial) |
| Notes | VARCHAR2(500) | ملاحظات |

### 6. جدول Invoice_Items
**الغرض**: تخزين بنود الفواتير (الأدوية المشتراة في كل فاتورة)

| الحقل | النوع | الوصف |
|-------|-------|-------|
| InvoiceItemID | NUMBER | معرف فريد لبند الفاتورة |
| InvoiceID | NUMBER | معرف الفاتورة |
| MedicineID | NUMBER | معرف الدواء |
| Quantity | NUMBER | الكمية المشتراة |
| UnitPrice | NUMBER(10,2) | سعر الوحدة |
| LineTotal | NUMBER(12,2) | الإجمالي للسطر |
| ExpiryDate | DATE | تاريخ الانتهاء |
| Notes | VARCHAR2(255) | ملاحظات |

### 7. جدول Employees
**الغرض**: تخزين بيانات الموظفين

| الحقل | النوع | الوصف |
|-------|-------|-------|
| EmployeeID | NUMBER | معرف فريد للموظف |
| EmployeeName | VARCHAR2(100) | اسم الموظف |
| Position | VARCHAR2(50) | الوظيفة |
| PhoneNumber | VARCHAR2(20) | رقم الهاتف |
| Email | VARCHAR2(100) | البريد الإلكتروني |
| Department | VARCHAR2(50) | القسم |
| JoinDate | DATE | تاريخ الالتحاق |
| Salary | NUMBER(10,2) | الراتب |
| IsActive | NUMBER(1) | حالة الموظف |

## العلاقات بين الجداول

1. **Invoices ← Customers**: كل فاتورة تنتمي إلى عميل واحد (One-to-Many)
2. **Invoice_Items ← Invoices**: كل فاتورة تحتوي على عدة بنود (One-to-Many)
3. **Invoice_Items ← Medicines**: كل بند فاتورة يشير إلى دواء واحد (Many-to-One)
4. **Medicines ← Suppliers**: كل دواء يأتي من مورد واحد (Many-to-One)
5. **Invoices ← Employees**: كل فاتورة يقوم بها موظف واحد (Many-to-One)

## الفهارس (Indexes)

تم إنشاء الفهارس التالية لتحسين الأداء:

```sql
IDX_Medicines_Name          -- للبحث السريع عن الأدوية بالاسم
IDX_Medicines_Barcode       -- للبحث السريع برقم الباركود
IDX_Invoices_Date           -- للبحث برمنة الفواتير
IDX_Invoices_Customer       -- للبحث عن فواتير عميل معين
IDX_InvoiceItems_Invoice    -- للبحث عن بنود فاتورة معينة
```

## Sequences

تم إنشاء Sequences لإنشاء معرفات تلقائية:

```sql
SEQ_Users
SEQ_Customers
SEQ_Suppliers
SEQ_Employees
SEQ_Medicines
SEQ_Invoices
SEQ_InvoiceItems
```

## Constraints والتحقق من الصحة

1. **Primary Keys**: معرفات فريدة لكل جدول
2. **Foreign Keys**: ربط الجداول معاً
3. **NOT NULL**: الحقول الإجبارية
4. **UNIQUE**: الحقول الفريدة (Username, InvoiceNumber, Barcode)
5. **CHECK**: التحقق من القيم (Role, CustomerType, etc.)
