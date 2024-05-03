


-- STEP 2: Use ticker as foreign key
DROP TABLE Security_Symbol

CREATE TABLE Security_Symbol (
		Ticker varchar(10) PRIMARY KEY,
		Name varchar(50));

INSERT INTO Security_Symbol(Ticker, Name)
Values('glw','Corning, Inc.')

INSERT INTO Security_Symbol(Ticker, Name)
Values('nvda','Nvidia Corporation, Inc.')

ALTER TABLE PriceHistory
ADD CONSTRAINT FK_TICKER_SYMBOL FOREIGN KEY (Ticker)
	REFERENCES Security_Symbol(Ticker);
