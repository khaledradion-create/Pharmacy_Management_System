# نظام إدارة الصيدلية - Pharmacy Management System

## نظرة عامة
نظام متكامل لإدارة الصيدليات يتضمن:
- ✅ إدارة المبيعات والفواتير
- ✅ إدارة المخزون والأدوية
- ✅ إدارة الموردين
- ✅ التقارير والإحصائيات
- ✅ لوحة تحكم (Dashboard)
- ✅ إدارة العملاء
- ✅ إدارة الموظفين

## التقنيات المستخدمة
- **Backend**: C# .NET 6/7
- **Database**: Oracle Database
- **Frontend**: Windows Forms / WPF
- **API**: ASP.NET Core Web API

## هيكل المشروع
```
PharmacyManagementSystem/
├── PharmacyManagement.API/           # Web API
├── PharmacyManagement.Desktop/       # تطبيق سطح المكتب
├── PharmacyManagement.Core/          # الفئات الأساسية والنماذج
├── PharmacyManagement.Data/          # طبقة البيانات و ORM
├── PharmacyManagement.Services/      # الخدمات والمنطق التجاري
├── Database/                         # ملفات قاعدة البيانات SQL
└── Documentation/                    # الوثائق
```

## البدء السريع
1. تثبيت Oracle Database
2. تشغيل سكريبتات قاعدة البيانات
3. تحديث سلسلة الاتصال في appsettings.json
4. تشغيل التطبيق

## المزيد من المعلومات
راجع مجلد Documentation للتفاصيل الكاملة
