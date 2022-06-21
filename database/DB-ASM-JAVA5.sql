USE [master]
GO
IF DB_ID('ShopAoNhom1') IS NOT NULL BEGIN
DROP DATABASE ShopAoNhom1
END
CREATE DATABASE ShopAoNhom1
GO
USE [ShopAoNhom1]
GO
CREATE TABLE [dbo].[Products](
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Info] [nvarchar](255),
	[Available] [bit] NOT NULL,
	[CategoryId] [varchar](10) NOT NULL,
	[BrandId] [varchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
	PRIMARY KEY ([Id])
	)
GO
CREATE TABLE [dbo].[Color](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [varchar](10) NOT NULL,
	[ImageId] [varchar](10) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	PRIMARY KEY ([Id],[ProductId]))
GO
CREATE TABLE [dbo].[Image](
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	PRIMARY KEY ([Id]))
GO
CREATE TABLE [dbo].[Brand](
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	PRIMARY KEY (Id))
GO
CREATE TABLE [dbo].[Size](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [varchar](10) NOT NULL,
	[Name] [nvarchar](5) NOT NULL,
	PRIMARY KEY ([Id],[ProductId]))
GO
CREATE TABLE [dbo].[Category](
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	PRIMARY KEY ([Id]))
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Activated] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
	PRIMARY KEY ([Username]))
GO

CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [varchar](10) NOT NULL,
	[SizeId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	PRIMARY KEY ([Id]))
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](11) NOT NULL,
	[TotalMoney]  [float] NOT NULL,
PRIMARY KEY ([Id]))
GO
INSERT INTO [dbo].[Accounts]([Username],[Password],[Fullname],[Email],[Photo],[Activated],[Admin]) VALUES
	   ('user','123',N'Tấn Phát','phathtps15403@fpt.edu.vn','',1,0),
	   ('admin','123','Administrator','tanphat9859@gmail.com','',1,1)
GO


INSERT INTO [dbo].[Brand]([Id],[Name]) VALUES
	('NLW','Next Level Wibu')
GO
INSERT INTO [dbo].Category([Id],[Name]) VALUES
	('HD','Hoodie'),
	('SW','Sweater'),
	('ATDT',N'Áo thun dài tay'),
	('AT',N'Áo thun')
GO
INSERT INTO [dbo].[Products]([Id],[Name],[Price],[Info],[Available],[CategoryId],[BrandId],[Quantity]) VALUES
	('WIBU01',N'Hoodie Beast of Darkness',450000,N'Sản phẩm của Young SG','1','HD','NLW',100),
	('WIBU02',N'Sweater Beast of Darkness',410000,N'Sản phẩm của Young SG','1','SW','NLW',100),
	('WIBU03',N'Áo thun dài tay Beast of Darkness',320000,N'Sản phẩm của Young SG','1','ATDT','NLW',100),
	('WIBU04',N'Áo thun Beast of Darkness',290000,N'Sản phẩm của Young SG','1','AT','NLW',100),
	('WIBU05',N'Hoodie Giyu Tomioka',450000,N'Sản phẩm của Young SG','1','HD','NLW',100),
	('WIBU06',N'Sweater Giyu Tomioka',410000,N'Sản phẩm của Young SG','1','SW','NLW',100),
	('WIBU07',N'Áo thun dài tay Giyu Tomioka',320000,N'Sản phẩm của Young SG','1','ATDT','NLW',100),
	('WIBU08',N'Áo thun Giyu Tomioka',290000,N'Sản phẩm của Young SG','1','AT','NLW',100),
	('WIBU09',N'Hoodie Wings of Freedom',450000,N'Sản phẩm của Young SG','1','HD','NLW',100),
	('WIBU10',N'Sweater Wings of Freedom',400000,N'Sản phẩm của Young SG','1','SW','NLW',100),
	('WIBU11',N'Áo thun dài tay Wings of Freedom',320000,N'Sản phẩm của Young SG','1','ATDT','NLW',100),
	('WIBU12',N'Áo thun Wings of Freedom',290000,N'Sản phẩm của Young SG','1','AT','NLW',100)

GO
INSERT INTO [dbo].[Size]([ProductId],[Name]) VALUES
	('WIBU01','S'),
	('WIBU01','M'),
	('WIBU01','L'),
	('WIBU01','XL'),
	('WIBU01','XXL'),
    ('WIBU02','S'),
	('WIBU02','M'),
	('WIBU02','L'),
	('WIBU02','XL'),
	('WIBU02','XXL'),
	('WIBU03','S'),
	('WIBU03','M'),
	('WIBU03','L'),
	('WIBU03','XL'),
	('WIBU03','XXL'),
	('WIBU04','S'),
	('WIBU04','M'),
	('WIBU04','L'),
	('WIBU04','XL'),
	('WIBU04','XXL'),
	('WIBU05','S'),
	('WIBU05','M'),
	('WIBU05','L'),
	('WIBU05','XL'),
	('WIBU05','XXL'),
	('WIBU06','S'),
	('WIBU06','M'),
	('WIBU06','L'),
	('WIBU06','XL'),
	('WIBU06','XXL'),
	('WIBU07','S'),
	('WIBU07','M'),
	('WIBU07','L'),
	('WIBU07','XL'),
	('WIBU07','XXL'),
	('WIBU08','S'),
	('WIBU08','M'),
	('WIBU08','L'),
	('WIBU08','XL'),
	('WIBU08','XXL'),
	('WIBU09','S'),
	('WIBU09','M'),
	('WIBU09','L'),
	('WIBU09','XL'),
	('WIBU09','XXL'),
	('WIBU10','S'),
	('WIBU10','M'),
	('WIBU10','L'),
	('WIBU10','XL'),
	('WIBU10','XXL'),
	('WIBU11','S'),
	('WIBU11','M'),
	('WIBU11','L'),
	('WIBU11','XL'),
	('WIBU11','XXL'),
	('WIBU12','S'),
	('WIBU12','M'),
	('WIBU12','L'),
	('WIBU12','XL'),
	('WIBU12','XXL')
GO
INSERT INTO [dbo].[Image]([Id],[Name]) VALUES
	('Imgwibu1','anhWIBU01_Whilte.jpg'),
	('Imgwibu2','anhWIBU01_Black.jpg'),
    ('Imgwibu3','anhWIBU02_Whilte.jpg'),
	('Imgwibu4','anhWIBU02_Black.jpg'),
    ('Imgwibu5','anhWIBU03_Whilte.jpg'),
	('Imgwibu6','anhWIBU03_Black.jpg'),
	('Imgwibu7','anhWIBU04_Whilte.jpg'),
	('Imgwibu8','anhWIBU04_Black.jpg'),
	('Imgwibu9','anhWIBU05_Whilte.jpg'),
	('Imgwibu10','anhWIBU05_Black.jpg'),
	('Imgwibu11','anhWIBU06_Whilte.jpg'),
	('Imgwibu12','anhWIBU06_Black.jpg'),
	('Imgwibu13','anhWIBU07_Whilte.jpg'),
	('Imgwibu14','anhWIBU07_Black.jpg'),
	('Imgwibu15','anhWIBU08_Whilte.jpg'),
	('Imgwibu16','anhWIBU08_Black.jpg'),
	('Imgwibu17','anhWIBU09_Whilte.jpg'),
	('Imgwibu18','anhWIBU09_Black.jpg'),
	('Imgwibu19','anhWIBU10_Whilte.jpg'),
	('Imgwibu20','anhWIBU10_Black.jpg'),
	('Imgwibu21','anhWIBU11_Whilte.jpg'),
	('Imgwibu22','anhWIBU11_Black.jpg'),
	('Imgwibu23','anhWIBU12_Whilte.jpg'),
	('Imgwibu24','anhWIBU12_Black.jpg')
GO
INSERT INTO [dbo].[Color]([ProductId],[ImageId],[Name]) VALUES
	('WIBU01','Imgwibu1','White'),
	('WIBU01','Imgwibu2','Black'),
    ('WIBU02','Imgwibu3','White'),
	('WIBU02','Imgwibu4','Black'),
    ('WIBU03','Imgwibu5','White'),
	('WIBU03','Imgwibu6','Black'),
	('WIBU04','Imgwibu7','White'),
	('WIBU04','Imgwibu8','Black'),
	('WIBU05','Imgwibu9','White'),
	('WIBU05','Imgwibu10','Black'),
	('WIBU06','Imgwibu11','White'),
	('WIBU06','Imgwibu12','Black'),
	('WIBU07','Imgwibu13','White'),
	('WIBU07','Imgwibu14','Black'),
	('WIBU08','Imgwibu15','White'),
	('WIBU08','Imgwibu16','Black'),
	('WIBU09','Imgwibu17','White'),
	('WIBU09','Imgwibu18','Black'),
	('WIBU10','Imgwibu19','White'),
	('WIBU10','Imgwibu20','Black'),
	('WIBU11','Imgwibu21','White'),
	('WIBU11','Imgwibu22','Black'),
	('WIBU12','Imgwibu23','White'),
	('WIBU12','Imgwibu24','Black')
GO

ALTER TABLE [dbo].[Products]
	ADD CONSTRAINT FK_Product_Brand
		FOREIGN KEY([BrandId]) REFERENCES [dbo].[Brand]([Id]);
			/*ON UPDATE CASCADE ON DELETE CASCADE;	  */
GO
ALTER TABLE [dbo].[Products]
	ADD CONSTRAINT FK_Product_Category
		FOREIGN KEY([CategoryId]) REFERENCES [dbo].[Category]([Id]);
			/*ON UPDATE CASCADE ON DELETE CASCADE;	  */
GO
ALTER TABLE [dbo].[Color]
	ADD CONSTRAINT FK_Color_Product
		FOREIGN KEY([ProductId]) REFERENCES [dbo].[Products]([Id])
			ON UPDATE CASCADE ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Color]
	ADD CONSTRAINT FK_Color_Image
		FOREIGN KEY([ImageId]) REFERENCES [dbo].[Image]([Id])
			ON UPDATE CASCADE ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Size] ADD CONSTRAINT FK_Size_Product
		FOREIGN KEY([ProductId]) REFERENCES [dbo].[Products]([Id])
			ON UPDATE CASCADE ON DELETE CASCADE;
GO

ALTER TABLE [dbo].[OrderDetails]  ADD CONSTRAINT FK_OrderDetails_Orders
	FOREIGN KEY([OrderId]) REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails]  ADD CONSTRAINT FK_OrderDetails_Product 
	FOREIGN KEY([ProductId]) REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails]  ADD CONSTRAINT FK_OrderDetails_Size 
	FOREIGN KEY([SizeId],[ProductId]) REFERENCES [dbo].[Size] ([Id],[ProductId])
GO
ALTER TABLE [dbo].[OrderDetails]  ADD CONSTRAINT FK_OrderDetails_Color 
	FOREIGN KEY([ColorId],[ProductId]) REFERENCES [dbo].[Color] ([Id],[ProductId])
GO
ALTER TABLE [dbo].[Orders]  ADD CONSTRAINT FK_Orders_Accounts 
	FOREIGN KEY([Username]) REFERENCES [dbo].[Accounts] ([Username])
GO
USE [master]
GO