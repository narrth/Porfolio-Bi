-- Step 8:	Identify and report the most significant positive spike in the price. 
--			Please provide a possible explanation for the spike.
-- nvda

-- Highest spike in close price (This includes after hour changes)
-- Need to get difference from closing price over two dates (some form of iteration required...)
;WITH tblDifference AS
(
    SELECT ROW_NUMBER() OVER(ORDER BY Dt) AS RowNumber, Dt, Close_Price 
    FROM dbo.PriceHistory
	where Ticker ='nvda' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'
)

SELECT previous.Dt AS 'Start Date', cur.Dt AS 'End Date',  cur.Close_Price, previous.Close_Price, (cur.Close_Price - previous.Close_Price) AS 'Close Price Change', 
(cur.Close_Price - previous.Close_Price)*100/previous.Close_Price AS 'Percentage Close Price Change'
FROM tblDifference cur
LEFT OUTER JOIN tblDifference previous
ON cur.RowNumber = previous.RowNumber + 1
order by cur.Dt asc--[Close Price Change] desc


--Reason: Earnings Feb 11  (Measuring close to close price, spiked Feb 11 - 12)
--Dt			Close_Price	Close Price Change	Percentage Close Price Change
--2015-02-12	5.575		0.3725				7.16

--**** price spike from open-close on the day
Select *, (Close_Price - Open_Price) AS 'Price Change', 
(Close_Price - Open_Price)*100/Open_Price AS 'Percentage Change'
from dbo.PriceHistory
where Ticker ='nvda' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'
order by Dt asc

Select Max(Close_Price - Open_Price) AS ' Max Price Change'
from dbo.PriceHistory
where Ticker ='nvda' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'

--0.2425 max price change 4.6478%
--Ticker	Dt			Close_Price	Volume		Open_Price	High_Price	Low_Price	Price Change	Percentage Change
--nvda		2015-05-27	5.46		43232000	5.2175		5.4837		5.20		0.2425			4.6478


-- Get the high and low max difference this is the largest spike
--**** Greatest spike = high - low ****
Select *, (High_Price - Low_Price) AS 'Price Spike', 
(High_Price - Low_Price)*100/Low_Price AS 'Percentage Change'
from dbo.PriceHistory
where Ticker ='nvda' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'
order by 'Percentage Change' asc

Select Max(High_Price - Low_Price) AS ' Max Price Change'
from dbo.PriceHistory
where Ticker ='nvda' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'

--0.355 max price change 6.7715%
--Ticker	Dt			Close_Price	Volume		Open_Price	High_Price	Low_Price	Price Spike	Percentage Change
--nvda		2015-03-25	5.26		54242680	5.5975		5.5975		5.2425		0.355		6.7715
