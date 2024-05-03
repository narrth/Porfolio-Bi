-- Step 5: Calculate and report the min, max, and average closing price
-- glw

-- Min Close Price = 19.70
-- Min Price = 19.57 (take the lowest of lows)
-- Max Close Price = 25.00
-- Max High Price = 25.16
-- Avg Close Price = 22.5699
Select MIN(Close_Price) AS 'Min Close Price',
 MIN(Low_Price) AS 'Min Low Price',
 MAX(Close_Price) AS 'Max Close Price',
 MAX(High_Price) AS 'Max High Price',
 Avg(Close_Price) AS 'Avg Close Price'
from dbo.PriceHistory
where Ticker = 'glw' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'

-- Min Close Price = 19.70
Select MIN(Close_Price) AS 'Min Close Price'
from dbo.PriceHistory
where Ticker = 'glw' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'

-- Min Price = 19.57 (take the lowest of lows)
Select MIN(Low_Price) AS 'Min Low Price'
from dbo.PriceHistory
where Ticker = 'glw' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'

-- Max Close Price = 25.00
Select MAX(Close_Price) AS 'Max Close Price'
from dbo.PriceHistory
where Ticker = 'glw' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'

-- Max High Price = 25.16
Select MAX(High_Price) AS 'Max High Price'
from dbo.PriceHistory
where Ticker = 'glw' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'

-- Avg Close Price = 22.5699
Select Avg(Close_Price) AS 'Avg Close Price'
from dbo.PriceHistory
where Ticker = 'glw' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'

-- Avg Close Price 22.5699
Select SUM(Close_Price)/COUNT(Close_Price)  AS 'Manually Avg Close Price'
from dbo.PriceHistory
where Ticker = 'glw' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'


Select *
from dbo.PriceHistory
where Ticker = 'glw' AND Dt >= '1/1/2015' AND Dt <= '6/30/2015'
ORDER BY Close_Price asc
