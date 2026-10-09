-- =====================================================
-- نظام إدارة الصيدلية - قاعدة البيانات
-- Pharmacy Management System - Database DDL
-- =====================================================

-- Drop existing tables (for development only)
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Invoice_Items';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Invoices';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Medicines';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Suppliers';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Employees';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Customers';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Users';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- =====================================================
-- جدول المستخدمين - Users Table
-- =====================================================
CREATE TABLE Users (
    UserID NUMBER PRIMARY KEY,
    Username VARCHAR2(50) NOT NULL UNIQUE,
    PasswordHash VARCHAR2(255) NOT NULL,
    Email VARCHAR2(100),
    FullName VARCHAR2(100),
    Role VARCHAR2(20), -- Admin, Manager, Cashier, Pharmacist
    IsActive NUMBER(1) DEFAULT 1,
    CreatedDate TIMESTAMP DEFAULT SYSDATE,
    LastLogin TIMESTAMP,
    CONSTRAINT CK_Users_Role CHECK (Role IN ('Admin', 'Manager', 'Cashier', 'Pharmacist'))
);

-- =====================================================
-- جدول العملاء - Customers Table
-- =====================================================
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(100) NOT NULL,
    PhoneNumber VARCHAR2(20),
    Email VARCHAR2(100),
    Address VARCHAR2(255),
    City VARCHAR2(50),
    Country VARCHAR2(50),
    CustomerType VARCHAR2(20), -- Individual, Corporate
    IsActive NUMBER(1) DEFAULT 1,
    CreatedDate TIMESTAMP DEFAULT SYSDATE,
    LastPurchaseDate TIMESTAMP
);

-- =====================================================
-- جدول الموردين - Suppliers Table
-- =====================================================
CREATE TABLE Suppliers (
    SupplierID NUMBER PRIMARY KEY,
    SupplierName VARCHAR2(100) NOT NULL,
    ContactPerson VARCHAR2(100),
    PhoneNumber VARCHAR2(20),
    Email VARCHAR2(100),
    Address VARCHAR2(255),
    City VARCHAR2(50),
    Country VARCHAR2(50),
    SupplierType VARCHAR2(50), -- Manufacturer, Distributor, Wholesaler
    TaxNumber VARCHAR2(50),
    PaymentTerms NUMBER, -- عدد أيام الدفع
    IsActive NUMBER(1) DEFAULT 1,
    CreatedDate TIMESTAMP DEFAULT SYSDATE
);

-- =====================================================
-- جدول الموظفين - Employees Table
-- =====================================================
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(100) NOT NULL,
    Position VARCHAR2(50), -- Pharmacist, Cashier, Warehouse Manager, Cleaner
    PhoneNumber VARCHAR2(20),
    Email VARCHAR2(100),
    Address VARCHAR2(255),
    DateOfBirth DATE,
    JoinDate DATE,
    Salary NUMBER(10,2),
    Department VARCHAR2(50),
    IsActive NUMBER(1) DEFAULT 1,
    CreatedDate TIMESTAMP DEFAULT SYSDATE
);

-- =====================================================
-- جدول الأدوية - Medicines Table
-- =====================================================
CREATE TABLE Medicines (
    MedicineID NUMBER PRIMARY KEY,
    MedicineName VARCHAR2(150) NOT NULL,
    GenericName VARCHAR2(150),
    Manufacturer VARCHAR2(100),
    SupplierID NUMBER NOT NULL,
    Strength VARCHAR2(50), -- مثل 500mg, 5ml
    UnitType VARCHAR2(20), -- tablet, capsule, liquid, injection
    CostPrice NUMBER(10,2) NOT NULL,
    SellingPrice NUMBER(10,2) NOT NULL,
    CurrentStock NUMBER,
    MinimumStock NUMBER DEFAULT 10,
    MaximumStock NUMBER,
    ExpiryDate DATE,
    BatchNumber VARCHAR2(50),
    Barcode VARCHAR2(50) UNIQUE,
    Description VARCHAR2(500),
    IsActive NUMBER(1) DEFAULT 1,
    CreatedDate TIMESTAMP DEFAULT SYSDATE,
    ModifiedDate TIMESTAMP DEFAULT SYSDATE,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- =====================================================
-- جدول الفواتير - Invoices Table
-- =====================================================
CREATE TABLE Invoices (
    InvoiceID NUMBER PRIMARY KEY,
    InvoiceNumber VARCHAR2(50) NOT NULL UNIQUE,
    CustomerID NUMBER NOT NULL,
    CashierID NUMBER,
    InvoiceDate TIMESTAMP DEFAULT SYSDATE,
    TotalAmount NUMBER(12,2),
    Discount NUMBER(10,2) DEFAULT 0,
    TaxAmount NUMBER(10,2) DEFAULT 0,
    NetAmount NUMBER(12,2),
    PaymentMethod VARCHAR2(20), -- Cash, Card, Check, Credit
    PaymentStatus VARCHAR2(20), -- Paid, Pending, Partial
    Notes VARCHAR2(500),
    CreatedDate TIMESTAMP DEFAULT SYSDATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (CashierID) REFERENCES Employees(EmployeeID)
);

-- =====================================================
-- جدول بنود الفواتير - Invoice Items Table
-- =====================================================
CREATE TABLE Invoice_Items (
    InvoiceItemID NUMBER PRIMARY KEY,
    InvoiceID NUMBER NOT NULL,
    MedicineID NUMBER NOT NULL,
    Quantity NUMBER NOT NULL,
    UnitPrice NUMBER(10,2),
    LineTotal NUMBER(12,2),
    ExpiryDate DATE,
    Notes VARCHAR2(255),
    CreatedDate TIMESTAMP DEFAULT SYSDATE,
    FOREIGN KEY (InvoiceID) REFERENCES Invoices(InvoiceID) ON DELETE CASCADE,
    FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID)
);

-- =====================================================
-- Indexes للبحث السريع
-- =====================================================
CREATE INDEX IDX_Medicines_Name ON Medicines(MedicineName);
CREATE INDEX IDX_Medicines_Barcode ON Medicines(Barcode);
CREATE INDEX IDX_Invoices_Date ON Invoices(InvoiceDate);
CREATE INDEX IDX_Invoices_Customer ON Invoices(CustomerID);
CREATE INDEX IDX_InvoiceItems_Invoice ON Invoice_Items(InvoiceID);

-- =====================================================
-- Sequences لإنشاء الـ IDs
-- =====================================================
CREATE SEQUENCE SEQ_Users START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_Customers START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_Suppliers START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_Employees START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_Medicines START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_Invoices START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_InvoiceItems START WITH 1 INCREMENT BY 1;

COMMIT;
