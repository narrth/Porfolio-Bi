-- Step 6: Calculate and report the min, max, and average closing price
-- nvda

-- Min Close Price = 4.7838
-- Min Price = 4.735 (take the lowest of lows)
-- Max Close Price = 5.8675
-- Max High Price = 5.9013
-- Avg Close Price = 5.371
Select MIN(Close_Price) AS 'Min Close Price',
 MIN(Low_Price) AS 'Min Low Price',
 MAX(Close_Price) AS 'Max Close Price',
 MAX(High_Price) AS 'Max High Price',
 Avg(Close_Price) AS 'Avg Close Price'
from dbo.PriceHistory
where Ticker = 'nvda' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'

-- Min Close Price = 4.7838
Select MIN(Close_Price) AS 'Min Close Price'
from dbo.PriceHistory
where Ticker = 'nvda' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'

-- Min Price = 4.735 (take the lowest of lows)
Select MIN(Low_Price) AS 'Min Low Price'
from dbo.PriceHistory
where Ticker = 'nvda' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'

-- Max Close Price = 5.8675
Select MAX(Close_Price) AS 'Max Close Price'
from dbo.PriceHistory
where Ticker = 'nvda' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'

-- Max High Price = 5.9013
Select MAX(High_Price) AS 'Max High Price'
from dbo.PriceHistory
where Ticker = 'nvda' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'

-- Avg Close Price = 5.371
Select Avg(Close_Price) AS 'Avg Close Price'
from dbo.PriceHistory
where Ticker = 'nvda' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'

-- Avg Close Price 5.371
Select SUM(Close_Price)/COUNT(Close_Price)  AS 'Manually Avg Close Price'
from dbo.PriceHistory
where Ticker = 'nvda' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'


Select *
from dbo.PriceHistory
where Ticker = 'nvda' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'
ORDER BY Close_Price asc

Select 'nvda', *
from dbo.nvda
where Dt >= '1/1/2015' AND Dt <= '6/30/2015'