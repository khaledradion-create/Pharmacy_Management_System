# نظام إدارة الصيدلية - Pharmacy Management System

## وصف المشروع
نظام إدارة صيدلية متكامل يدعم:
- إدارة المخزون والأدوية
- إنشاء الفواتير ومتابعة المبيعات
- إدارة الموردين والعملاء
- لوحة تحكم (Dashboard)
- التقارير والإحصائيات
- اتصال مع قاعدة بيانات Oracle

## البنية الحالية
- API: ASP.NET Core
- Database: Oracle
- Business Layer: Services
- Domain Model: Core Entities

## بداية التشغيل
1. تثبيت .NET 8 SDK
2. تثبيت Oracle Client / Oracle.ManagedDataAccess
3. ضبط بيانات الاتصال في `src/PharmacyManagement.API/appsettings.json`
4. تشغيل المشروع:

```bash
dotnet restore
dotnet build
dotnet run --project src/PharmacyManagement.API/PharmacyManagement.API.csproj
```

## نقاط الوصول الرئيسية
- `GET /api/dashboard/summary`
- `GET /api/dashboard/low-stock`
- `GET /api/reports/monthly-sales`
- `GET /api/invoices`
- `POST /api/invoices`

## ملاحظات
هذا المشروع يمثل هيكلًا جاهزًا للتنفيذ الفعلي ويحتوي على منطق Dashboard وReports وInvoice System باستخدام Oracle EF Core.
