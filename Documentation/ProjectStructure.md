# هيكل المشروع - Project Structure

## نظرة عامة
نظام متكامل لإدارة الصيدليات مبني على معمارية متعددة الطبقات (Multi-Layered Architecture)

## طبقات التطبيق

### 1. Presentation Layer (طبقة العرض)
- **PharmacyManagement.Desktop**: تطبيق Windows Forms/WPF
  - فاشن المستخدم (UI Forms)
  - التحكم بالتفاعلات
  - عرض البيانات

- **PharmacyManagement.API**: ASP.NET Core Web API
  - REST Endpoints
  - Authentication & Authorization
  - Request/Response Handling

### 2. Business Logic Layer (طبقة المنطق التجاري)
- **PharmacyManagement.Services**
  - InvoiceService: إدارة الفواتير
  - MedicineService: إدارة الأدوية والمخزون
  - SupplierService: إدارة الموردين
  - CustomerService: إدارة العملاء
  - ReportService: إنشاء التقارير
  - DashboardService: بيانات لوحة التحكم
  - UserService: إدارة المستخدمين والمصادقة

### 3. Data Access Layer (طبقة الوصول للبيانات)
- **PharmacyManagement.Data**
  - DbContext (Entity Framework Core)
  - Repositories Pattern
  - Migrations
  - Connection Management

### 4. Core/Domain Layer (طبقة النموذج)
- **PharmacyManagement.Core**
  - Entities: User, Customer, Medicine, Invoice, etc.
  - DTOs: Data Transfer Objects
  - Enums: Status, Roles, etc.
  - Interfaces: Service Contracts

## المميزات الرئيسية

### 1. إدارة الفواتير
- إنشاء فواتير جديدة
- تحديث الفواتير
- حذف/إلغاء الفواتير
- طباعة الفواتير
- البحث والتصفية
- تقارير المبيعات اليومية/الشهرية

### 2. إدارة المخزون
- تتبع كميات الأدوية
- تنبيهات المخزون المنخفض
- تاريخ انتهاء الصلاحية
- التحكم بأرقام الدفعات
- تقارير المخزون

### 3. إدارة الموردين
- بيانات الموردين الكاملة
- تتبع الطلبات
- إدارة شروط الدفع
- التقييمات والملاحظات

### 4. لوحة التحكم (Dashboard)
- إجمالي المبيعات اليومية
- أفضل الأدوية مبيعاً
- إنذارات المخزون المنخفض
- أداء الموظفين
- إحصائيات العملاء
- الرسوم البيانية والمخططات

### 5. التقارير
- تقرير المبيعات
- تقرير المخزون
- تقرير الموردين
- تقرير الموظفين
- تقرير الأداء المالي
- تقرير تحليل الأرباح

### 6. الأمان
- نظام تسجيل دخول آمن
- دور المستخدم والصلاحيات
- تشفير كلمات المرور
- تسجيل العمليات (Audit Log)
- التحكم بالوصول (Access Control)

## قاعدة البيانات

### الجداول الرئيسية
1. **Users**: المستخدمين والمسؤولين
2. **Customers**: العملاء
3. **Suppliers**: الموردين
4. **Employees**: الموظفين
5. **Medicines**: الأدوية والمنتجات
6. **Invoices**: الفواتير
7. **Invoice_Items**: بنود الفواتير

## تقنيات مستخدمة

### Backend
- **Language**: C#
- **Framework**: .NET 6/7
- **ORM**: Entity Framework Core
- **API**: ASP.NET Core
- **Authentication**: JWT Tokens

### Database
- **RDBMS**: Oracle Database
- **Connection**: Oracle Data Provider for .NET
- **Migrations**: Entity Framework Migrations

### Frontend
- **Desktop**: Windows Forms / WPF
- **Styling**: Material Design / ModernUI
- **Charts**: OxyPlot / LiveCharts
- **Reporting**: iTextSharp / Crystal Reports

### Tools
- **Version Control**: Git
- **IDE**: Visual Studio 2022
- **Database Tools**: Oracle SQL Developer
- **API Testing**: Postman

## معمارية التطبيق

```
┌─────────────────────────────────────┐
│   Presentation Layer                │
│  ┌─────────────────────────────────┐│
│  │ Desktop App (WinForms/WPF)      ││
│  │ Web API (ASP.NET Core)          ││
│  └─────────────────────────────────┘│
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│   Business Logic Layer              │
│  ┌─────────────────────────────────┐│
│  │ Services (Interfaces)           ││
│  │ - InvoiceService                ││
│  │ - MedicineService               ││
│  │ - SupplierService               ││
│  │ - DashboardService              ││
│  │ - ReportService                 ││
│  └─────────────────────────────────┘│
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│   Data Access Layer                 │
│  ┌─────────────────────────────────┐│
│  │ Entity Framework Core           ││
│  │ Repositories                    ││
│  │ DbContext                       ││
│  └─────────────────────────────────┘│
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│   Database Layer                    │
│  ┌─────────────────────────────────┐│
│  │ Oracle Database                 ││
│  │ Tables, Views, Stored Procs     ││
│  └─────────────────────────────────┘│
└─────────────────────────────────────┘
```

## خطوات التطوير المستقبلية
1. إنشاء Entity Classes
2. تكوين DbContext و Connection String
3. إنشاء Repositories
4. بناء Services
5. إنشاء API Controllers
6. تطوير واجهة المستخدم
7. إضافة التقارير
8. اختبار شامل
9. التوثيق الكامل
