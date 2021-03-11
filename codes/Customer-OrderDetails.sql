CREATE TABLE
Customer(
			Id INT IDENTITY CONSTRAINT Pk_CustomerId PRIMARY KEY,
			Pincode CHAR(6) NOT NULL CONSTRAINT Chk_Pincode CHECK(Pincode LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]'),
			MobileNo VARCHAR(10)NOT NULL UNIQUE CONSTRAINT Chk_MobileNo CHECK(MobileNo LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
			EmailId EMAILUDT NOT NULL UNIQUE,
			City VARCHAR(20) NOT NULL
		)
		

SP_HELP Customer

INSERT 
Customer(
			
			Pincode,
			MobileNo,
			EmailId,
			City
		)
VALUES	(
			
			'753004',
			'7874155953',
			'prayas21mishra@gmail.com',
			'Delhi'
		)

INSERT 
Customer(
			Pincode,
			MobileNo,
			EmailId,
			City
		)
VALUES	(
			'751006',
			'8745220125',
			'aman20mishra@gmail.com',
			'Delhi'
		)


SELECT * FROM Customer





CREATE TABLE OrderDetails(
							Id INT IDENTITY NOT NULL PRIMARY KEY,
							[Description] VARCHAR(200)NOT NULL,
							OrderDate DATETIME NOT NULL CONSTRAINT Df_OrderDetailsOrderDate DEFAULT GETDATE(),
							TotalPrice MONEY CHECK(TOTALPRICE>0),
							Quantity INT CONSTRAINT Chk_Quantity CHECK(Quantity BETWEEN 1 AND 10), 
							CustomerId INT CONSTRAINT Fk_OrderDetails_Customer FOREIGN KEY REFERENCES Customer(Id)
						 )


SP_HELP OrderDetails

INSERT 
OrderDetails(
				[Description],
				OrderDate,
				TotalPrice,
				Quantity
			)
VALUES	(
			'ORDERED MATERIALS',
			'2021-03-08',
			5000,
			5
		)

INSERT 
OrderDetails(
				[Description],
				OrderDate,
				TotalPrice,
				Quantity
			)
VALUES	(
			'PAINTING MATERIALS',
			'2021-01-21',
			2000,
			10
		)

INSERT 
OrderDetails(
				[Description],
				OrderDate,
				TotalPrice,
				Quantity,
				CustomerId
			)
VALUES	(
			'CONTRUCTION EQUIPMENT',
			'2021-02-09',
			50000,
			10,
			2
		)

SELECT * FROM OrderDetails




