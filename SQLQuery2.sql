Use StoreDB;
Go

INSERT INTO Customers (FullName, PhoneNumber, Email, ShippingAddress, RegistrationDate)
VALUES ('Salma Ahmed', '01012345678', 'salma.ahmed@email.com', '123 El-Obour City, Cairo', GETDATE());

INSERT INTO Suppliers (Name, Country, Email, Address, ContactNumber)
VALUES 
('TechGlobal', 'Egypt', 't@g.com', 'Cairo', '0223456789'),
('Alpha', 'UAE', 'a@a.ae', 'Dubai', '+9714123'),
('Prime', 'Germany', 'p@p.de', 'Berlin', '+4930123');

INSERT INTO Categories (Name, Description, MainCategory)
VALUES 
('Electronics', 'Gadgets and accessories', NULL),
('Home & Kitchen', 'Home appliances', NULL);

INSERT INTO Products (Name, UnitPrice)
VALUES ('Wireless Bluetooth Mouse', 450.00);

INSERT INTO ArchivedStock (TranId, ProductId, QuantityChange, TranDate)
SELECT TransId, ProductId, QuantityChange, TransDate
FROM StockTransactions
WHERE TransDate < '2023-01-01';

update Products
set UnitPrice += (UnitPrice *0.1) 
where UnitPrice < 100 


update Orders
set status = case 
				when OrderAmount > 5000 then 'Premium'
				else 'Standard'
				end
