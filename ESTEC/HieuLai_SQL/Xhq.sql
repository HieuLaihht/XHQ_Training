--Function Cal Electricity XMHP
CREATE Function [dbo].[Cal_Electricity]()
returns table
as return
(select name, timestamp, value, lead(value,1) over(partition by name order by timestamp) as value_minutes, lead(value,1) over(partition by name order by timestamp) - value as subValue
from [dbo].['23_08_02$']
)