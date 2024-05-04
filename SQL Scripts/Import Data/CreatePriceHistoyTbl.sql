-- STEP 1: Create a table to hold the pricing history
-- Table name
-- PriceHistory
	-- Stock 
		-- Set up as foreign key
	-- Date
	-- Close/Last
	-- Volume
	-- Open
	-- High
	-- Low 
		-- use nvarchar(50) as dtype
		-- remove the dollar sign and commas then convert it
		-- smallmoney?

		drop table PriceHistory

		CREATE TABLE PriceHistory (
		Ticker varchar(10),
		Dt Date,
		Close_Price smallmoney,
		Volume int,
		Open_Price  smallmoney,
		High_Price smallmoney,
		Low_Price smallmoney,
		);
