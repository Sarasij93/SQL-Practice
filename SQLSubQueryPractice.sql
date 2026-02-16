/*

Description: A subquery to pick all invoices which were greater than the average invoice total generated in 2010

*/

SELECT

	InvoiceDate,

	InvoiceId,

	Total,

	(select round(avg(Total),2) from invoices) AS [Average Total in 2010]

FROM 

	invoices

WHERE 

	TOTAL &gt; 

	(select 

		avg(total) 

	from 

		invoices 

	where 

		strftime('%Y',InvoiceDate) = '2010')

ORDER BY

	Total DESC


