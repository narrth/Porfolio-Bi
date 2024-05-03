
--********************* NVDA ***********************
--STEP 4: Create NVDA table, clean data
--drop TABLE dbo.nvda;

			CREATE TABLE nvda (
		Dt Date,
		Close_Price nvarchar(50),
		Volume int,
		Open_Price  nvarchar(50),
		High_Price nvarchar(50),
		Low_Price nvarchar(50),
		);

BULK INSERT nvda 
From 'D:\Documents\Coding\nvda\HistoricalData_1714618638688.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK
)

-- Clean data before moving to price history table
-- remove $ signs
UPDATE dbo.nvda
SET	Close_Price = REPLACE(Close_Price, '$', ''),
	Open_Price = REPLACE(Open_Price, '$', ''),
	High_Price = REPLACE(High_Price, '$', ''),
	Low_Price = REPLACE(Low_Price, '$', '')

ALTER TABLE nvda
ALTER COLUMN Close_Price smallmoney;

ALTER TABLE nvda
ALTER COLUMN Open_Price smallmoney;

ALTER TABLE nvda
ALTER COLUMN High_Price smallmoney;

ALTER TABLE nvda
ALTER COLUMN Low_Price smallmoney;


-- COPY ROW from glw table to price history table
INSERT INTO dbo.PriceHistory
Select 'nvda', *
from dbo.nvda
where Dt >= '1/1/2015' AND Dt <= '6/30/2015'
