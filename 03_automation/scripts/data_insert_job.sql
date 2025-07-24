USE ProdDB;
GO

-- Create the Sales table if it doesn't exist
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Sales' AND xtype='U')
BEGIN
    CREATE TABLE Sales (
        SaleID INT IDENTITY(1,1),
        Product NVARCHAR(50),
        Quantity INT,
        SaleDate DATETIME DEFAULT GETDATE()
    );
END
GO

-- Insert sample data
INSERT INTO Sales (Product, Quantity)
VALUES 
    ('Product_A', 5),
    ('Product_B', 8),
    ('Product_C', 3);
