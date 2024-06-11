-- สร้างฐานข้อมูลและใช้ฐานข้อมูลนั้น
CREATE DATABASE MyStore;
USE MyStore;

-- ตาราง Categories (หมวดหมู่สินค้า)
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);

-- ตาราง Products (สินค้า)
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    CategoryID INT,
    Price DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL,
    Description TEXT,
    Barcode VARCHAR(100),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- ตาราง Customers (ลูกค้า)
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    PhoneNumber VARCHAR(50),
    Address TEXT
);

-- ตาราง Employees (พนักงาน)
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeName VARCHAR(255) NOT NULL,
    Position VARCHAR(100),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(50)
);

-- ตาราง Suppliers (ซัพพลายเออร์)
CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(50),
    Address TEXT
);

-- ตาราง Purchases (การสั่งซื้อสินค้า)
CREATE TABLE Purchases (
    PurchaseID INT AUTO_INCREMENT PRIMARY KEY,
    PurchaseDate DATE NOT NULL,
    SupplierID INT,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- ตาราง Sales (การขาย)
CREATE TABLE Sales (
    SaleID INT AUTO_INCREMENT PRIMARY KEY,
    SaleDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,
    CustomerID INT,
    EmployeeID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- ตาราง SaleItems (รายการสินค้าที่ขาย)
CREATE TABLE SaleItems (
    SaleItemID INT AUTO_INCREMENT PRIMARY KEY,
    SaleID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- ตาราง PurchaseItems (รายการสินค้าที่สั่งซื้อ)
CREATE TABLE PurchaseItems (
    PurchaseItemID INT AUTO_INCREMENT PRIMARY KEY,
    PurchaseID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (PurchaseID) REFERENCES Purchases(PurchaseID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- ตาราง Inventory (คลังสินค้า)
CREATE TABLE Inventory (
    InventoryID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    Quantity INT NOT NULL,
    Location VARCHAR(255),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- ตาราง Discounts (ส่วนลด)
CREATE TABLE Discounts (
    DiscountID INT AUTO_INCREMENT PRIMARY KEY,
    DiscountName VARCHAR(255),
    DiscountPercentage DECIMAL(5, 2),
    StartDate DATE,
    EndDate DATE
);
