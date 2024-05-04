-- Step 9:	Calculate the return on investment for 1,000 shares from 1/1/2015 to the date of any
--			one significant price spike. You may choose either security for this exercise.
--glw
--select (24.73 - Open_Price) * 1000
--from PriceHistory
--where Ticker ='glw' AND Dt = '2015-01-02'

Declare @glw_Open smallmoney 

select @glw_Open = Open_Price
from PriceHistory
where Ticker ='glw' AND Dt = '2015-01-02'

select (Close_Price - @glw_Open)* 100/@glw_Open 
from PriceHistory
where Ticker ='glw' AND Dt = '2015-01-27'

--Dt			Close_Price	Close Price Change	Percentage Close Price Change
--2015-01-27	24.73		0.82				3.4295
--ROI: 7.3816%		Profit: 1700.00


--nvda
--select (5.575 - Open_Price) * 1000
--from PriceHistory
--where Ticker ='nvda' AND Dt = '2015-01-02'

Declare @glw_Open smallmoney 

select @glw_Open = Open_Price
from PriceHistory
where Ticker ='nvda' AND Dt = '2015-01-02'

select (Close_Price - @glw_Open)* 100/@glw_Open 
from PriceHistory
where Ticker ='nvda' AND Dt = '2015-02-12'


--Dt			Close_Price	Close Price Change	Percentage Close Price Change
--2015-02-12	5.575		0.3725				7.16
--ROI: 10.7799%		Profit: 542.50
