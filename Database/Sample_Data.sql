-- =====================================================
-- بيانات تجريبية - Sample Data
-- =====================================================

-- إضافة مستخدمين
INSERT INTO Users (UserID, Username, PasswordHash, Email, FullName, Role, IsActive)
VALUES (1, 'admin', 'HASHED_PASSWORD_HERE', 'admin@pharmacy.com', 'مدير النظام', 'Admin', 1);

INSERT INTO Users (UserID, Username, PasswordHash, Email, FullName, Role, IsActive)
VALUES (2, 'manager', 'HASHED_PASSWORD_HERE', 'manager@pharmacy.com', 'مدير المبيعات', 'Manager', 1);

INSERT INTO Users (UserID, Username, PasswordHash, Email, FullName, Role, IsActive)
VALUES (3, 'cashier1', 'HASHED_PASSWORD_HERE', 'cashier@pharmacy.com', 'أحمد الكاشير', 'Cashier', 1);

INSERT INTO Users (UserID, Username, PasswordHash, Email, FullName, Role, IsActive)
VALUES (4, 'pharmacist', 'HASHED_PASSWORD_HERE', 'pharmacist@pharmacy.com', 'د. محمد الصيدلاني', 'Pharmacist', 1);

-- إضافة موردين
INSERT INTO Suppliers (SupplierID, SupplierName, ContactPerson, PhoneNumber, Email, City, Country, SupplierType, IsActive)
VALUES (1, 'شركة الدواء الأساسية', 'محمود علي', '555-0001', 'contact@basic.com', 'القاهرة', 'مصر', 'Distributor', 1);

INSERT INTO Suppliers (SupplierID, SupplierName, ContactPerson, PhoneNumber, Email, City, Country, SupplierType, IsActive)
VALUES (2, 'مصنع الأدوية المتقدمة', 'فاطمة محمد', '555-0002', 'info@advanced.com', 'الجيزة', 'مصر', 'Manufacturer', 1);

INSERT INTO Suppliers (SupplierID, SupplierName, ContactPerson, PhoneNumber, Email, City, Country, SupplierType, IsActive)
VALUES (3, 'موزع الأدوية الدولي', 'خالد إبراهيم', '555-0003', 'sales@intl.com', 'الإسكندرية', 'مصر', 'Wholesaler', 1);

-- إضافة عملاء
INSERT INTO Customers (CustomerID, CustomerName, PhoneNumber, Email, Address, City, Country, CustomerType, IsActive)
VALUES (1, 'علي محمد', '555-1001', 'ali@email.com', 'شارع النيل 45', 'القاهرة', 'مصر', 'Individual', 1);

INSERT INTO Customers (CustomerID, CustomerName, PhoneNumber, Email, Address, City, Country, CustomerType, IsActive)
VALUES (2, 'مستشفى الأمل', '555-1002', 'hospital@hope.com', 'شارع السلام 100', 'الجيزة', 'مصر', 'Corporate', 1);

INSERT INTO Customers (CustomerID, CustomerName, PhoneNumber, Email, Address, City, Country, CustomerType, IsActive)
VALUES (3, 'فاطمة أحمد', '555-1003', 'fatema@email.com', 'شارع التحرير 23', 'الإسكندرية', 'مصر', 'Individual', 1);

-- إضافة موظفين
INSERT INTO Employees (EmployeeID, EmployeeName, Position, PhoneNumber, Email, Department, JoinDate, Salary, IsActive)
VALUES (1, 'د. محمد الصيدلاني', 'Pharmacist', '555-2001', 'pharmacist@pharmacy.com', 'Pharmacy', SYSDATE-365, 5000, 1);

INSERT INTO Employees (EmployeeID, EmployeeName, Position, PhoneNumber, Email, Department, JoinDate, Salary, IsActive)
VALUES (2, 'أحمد الكاشير', 'Cashier', '555-2002', 'cashier@pharmacy.com', 'Sales', SYSDATE-180, 2000, 1);

INSERT INTO Employees (EmployeeID, EmployeeName, Position, PhoneNumber, Email, Department, JoinDate, Salary, IsActive)
VALUES (3, 'سارة مدير المستودع', 'Warehouse Manager', '555-2003', 'warehouse@pharmacy.com', 'Warehouse', SYSDATE-200, 3000, 1);

-- إضافة أدوية
INSERT INTO Medicines (MedicineID, MedicineName, GenericName, Manufacturer, SupplierID, Strength, UnitType, CostPrice, SellingPrice, CurrentStock, MinimumStock, Barcode, IsActive)
VALUES (1, 'باراسيتامول', 'Paracetamol', 'شركة الأدوية المتقدمة', 2, '500mg', 'tablet', 0.25, 0.50, 500, 50, '978020137962', 1);

INSERT INTO Medicines (MedicineID, MedicineName, GenericName, Manufacturer, SupplierID, Strength, UnitType, CostPrice, SellingPrice, CurrentStock, MinimumStock, Barcode, IsActive)
VALUES (2, 'أسبرين', 'Aspirin', 'شركة الدواء الأساسية', 1, '100mg', 'tablet', 0.15, 0.30, 1000, 100, '978020137963', 1);

INSERT INTO Medicines (MedicineID, MedicineName, GenericName, Manufacturer, SupplierID, Strength, UnitType, CostPrice, SellingPrice, CurrentStock, MinimumStock, Barcode, IsActive)
VALUES (3, 'أموكسيسيلين', 'Amoxicillin', 'موزع الأدوية الدولي', 3, '250mg', 'capsule', 0.40, 0.80, 300, 30, '978020137964', 1);

INSERT INTO Medicines (MedicineID, MedicineName, GenericName, Manufacturer, SupplierID, Strength, UnitType, CostPrice, SellingPrice, CurrentStock, MinimumStock, Barcode, IsActive)
VALUES (4, 'شراب السعال', 'Cough Syrup', 'شركة الأدوية المتقدمة', 2, '5ml', 'liquid', 1.50, 3.00, 200, 20, '978020137965', 1);

INSERT INTO Medicines (MedicineID, MedicineName, GenericName, Manufacturer, SupplierID, Strength, UnitType, CostPrice, SellingPrice, CurrentStock, MinimumStock, Barcode, IsActive)
VALUES (5, 'حقنة أنسولين', 'Insulin Injection', 'موزع الأدوية الدولي', 3, '100UI', 'injection', 5.00, 10.00, 150, 15, '978020137966', 1);

COMMIT;
