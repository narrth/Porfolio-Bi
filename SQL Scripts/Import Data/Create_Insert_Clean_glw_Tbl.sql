
--********************* GLW ***********************
--STEP 3: Create glw table, clean data
--drop TABLE dbo.glw;

			CREATE TABLE glw (
		Dt Date,
		Close_Price nvarchar(50),
		Volume int,
		Open_Price  nvarchar(50),
		High_Price nvarchar(50),
		Low_Price nvarchar(50),
		);

--BULK INSERT glw 
--From 'D:\Documents\Coding\glw\HistoricalData_1714616708883.csv'
--WITH
--(
--FIRSTROW = 2,
--FIELDTERMINATOR = ',',
--ROWTERMINATOR = '\n',
--TABLOCK
--)

-- Clean data before moving to price history table
-- remove $ signs
UPDATE dbo.glw
SET	Close_Price = REPLACE(Close_Price, '$', ''),
	Open_Price = REPLACE(Open_Price, '$', ''),
	High_Price = REPLACE(High_Price, '$', ''),
	Low_Price = REPLACE(Low_Price, '$', '')

ALTER TABLE glw
ALTER COLUMN Close_Price smallmoney;

ALTER TABLE glw
ALTER COLUMN Open_Price smallmoney;

ALTER TABLE glw
ALTER COLUMN High_Price smallmoney;

ALTER TABLE glw
ALTER COLUMN Low_Price smallmoney;


-- COPY ROW from glw table to price history table
INSERT INTO dbo.PriceHistory
Select 'glw', *
from dbo.glw
where Dt >= '1/1/2015' AND Dt <= '6/30/2015'

