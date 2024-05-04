-- Step 7:	Identify and report the most significant positive spike in the price. 
--			Please provide a possible explanation for the spike.
-- glw

-- Highest spike in close price (This includes after hour changes)
-- Need to get difference from closing price over two dates (some form of iteration required...)
;WITH tblDifference AS
(
    SELECT ROW_NUMBER() OVER(ORDER BY Dt) AS RowNumber, Dt, Close_Price 
    FROM dbo.PriceHistory
	where Ticker ='glw' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'
)

SELECT cur.Dt, cur.Close_Price, (cur.Close_Price - previous.Close_Price) AS 'Close Price Change', 
(cur.Close_Price - previous.Close_Price)*100/previous.Close_Price AS 'Percentage Close Price Change'
FROM tblDifference cur
LEFT OUTER JOIN tblDifference previous
ON cur.RowNumber = previous.RowNumber + 1
order by Dt asc

--Reason: Earnings Jan 27 *BEFORE MARKET OPEN (Measuring close to close price, spiked Jan 26 - 27) (***actually spiked higher open to close on this day)
--Dt			Close_Price	Close Price Change	Percentage Close Price Change
--2015-01-27	24.73		0.82				3.4295

--**** price spike from open-close on the day
Select *, (Close_Price - Open_Price) AS 'Price Change', 
(Close_Price - Open_Price)*100/Open_Price AS 'Percentage Change'
from dbo.PriceHistory
where Ticker ='glw' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'
order by Dt asc

Select Max(Close_Price - Open_Price) AS ' Max Price Change'
from dbo.PriceHistory
where Ticker ='glw' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'

--1.02 max price change 4.3019%
--Ticker	Dt			Close_Price	Volume		Open_Price	High_Price	Low_Price	Price Change	Percentage Change
--glw		2015-01-27	24.73		16547920	23.71		24.98		23.70		1.02			4.3019


-- Get the high and low max difference this is the largest spike
--**** Greatest spike = high - low ****
Select *, (High_Price - Low_Price) AS 'Price Spike', 
(High_Price - Low_Price)*100/Low_Price AS 'Percentage Change'
from dbo.PriceHistory
where Ticker ='glw' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'
order by 'Percentage Change' asc

Select Max(High_Price - Low_Price) AS ' Max Price Change'
from dbo.PriceHistory
where Ticker ='glw' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'

--1.28 max price change 5.4008%
--Ticker	Dt			Close_Price	Volume		Open_Price	High_Price	Low_Price	Price Spike	Percentage Change
--glw		2015-01-27	24.73		16547920	23.71		24.98		23.70		1.28		5.4008

