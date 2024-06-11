USE MPN_Data;

-- เพิ่มข้อมูลในตาราง Categories (หมวดหมู่สินค้า)
INSERT INTO Categories (CategoryName) VALUES
('Condiments');

-- เพิ่มข้อมูลในตาราง Products (สินค้า)
INSERT INTO Products (ProductName, CategoryID, Price, Quantity, Description, Barcode) VALUES
('Chili Paste', 1, 50.00, 100, 'Spicy chili paste', '1234567890123'),
('Dipping Sauce', 1, 30.00, 200, 'Sweet and sour dipping sauce', '1234567890124');

-- เพิ่มข้อมูลในตาราง Customers (ลูกค้า)
INSERT INTO Customers (CustomerName, Email, PhoneNumber, Address) VALUES
('John Doe', 'john.doe@example.com', '1234567890', '123 Elm Street'),
('Jane Smith', 'jane.smith@example.com', '0987654321', '456 Oak Street');

-- เพิ่มข้อมูลในตาราง Employees (พนักงาน)
INSERT INTO Employees (EmployeeName, Position, Email, PhoneNumber) VALUES
('Alice Brown', 'Sales Manager', 'alice.brown@example.com', '1231231234'),
('Bob White', 'Cashier', 'bob.white@example.com', '3213214321');

-- เพิ่มข้อมูลในตาราง Suppliers (ซัพพลายเออร์)
INSERT INTO Suppliers (SupplierName, ContactName, Email, PhoneNumber, Address) VALUES
('Thai Spices Co.', 'Somchai Srisuk', 'somchai@example.com', '1122334455', '789 Pine Street'),
('Spicy Foods Ltd.', 'Anucha Wong', 'anucha@example.com', '5566778899', '101 Maple Street');

-- เพิ่มข้อมูลในตาราง Purchases (การสั่งซื้อสินค้า)
INSERT INTO Purchases (PurchaseDate, SupplierID, TotalAmount) VALUES
('2024-06-01', 1, 5000.00),
('2024-06-02', 2, 3000.00);

-- เพิ่มข้อมูลในตาราง PurchaseItems (รายการสินค้าที่สั่งซื้อ)
INSERT INTO PurchaseItems (PurchaseID, ProductID, Quantity, Price) VALUES
(1, 1, 100, 50.00),
(1, 2, 100, 30.00),
(2, 1, 50, 50.00),
(2, 2, 50, 30.00);

-- เพิ่มข้อมูลในตาราง Sales (การขาย)
INSERT INTO Sales (SaleDate, TotalAmount, PaymentMethod, CustomerID, EmployeeID) VALUES
('2024-06-03', 150.00, 'Credit Card', 1, 1),
('2024-06-04', 90.00, 'Cash', 2, 2);

-- เพิ่มข้อมูลในตาราง SaleItems (รายการสินค้าที่ขาย)
INSERT INTO SaleItems (SaleID, ProductID, Quantity, Price) VALUES
(1, 1, 2, 50.00),
(1, 2, 1, 30.00),
(2, 2, 3, 30.00);

-- เพิ่มข้อมูลในตาราง Inventory (คลังสินค้า)
INSERT INTO Inventory (ProductID, Quantity, Location) VALUES
(1, 150, 'Aisle 1'),
(2, 250, 'Aisle 2');

-- เพิ่มข้อมูลในตาราง Discounts (ส่วนลด)
INSERT INTO Discounts (DiscountName, DiscountPercentage, StartDate, EndDate) VALUES
('Summer Sale', 10.00, '2024-06-01', '2024-06-30'),
('Holiday Discount', 15.00, '2024-12-01', '2024-12-31');
