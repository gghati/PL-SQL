
-- RANKING in SQL
select card_id, salary_hour, 
		rank() over(order by salary_hour) as p_rank
from employee 
order by p_rank; 

/*

Result of 1) RANKING

Employee table:
'1',NULL,'6am-2pm','student','20.00'
'2','1','1pm-10pm','student','19.00'
'3','1','9am-7pm','student','19.00'
'4','1','9am-7pm','student','20.00'
'5','1','1pm-10pm','student','23.00'
'6','2','1pm-10pm','student','24.00'
'7','2','8am-4pm','student','22.00'
'8','2','1pm-10pm','student','23.00'
'9','2','9am-7pm','full time','20.00'
'10','2','1pm-10pm','student','25.00'
'11','3','1pm-10pm','full time','21.00'
'12','3','1pm-10pm','student','19.00'
'13','3','11am-9pm','full time','20.00'
'14','3','6am-2pm','student','22.00'
'15','3','8am-4pm','full time','25.00'
'16','4','6am-2pm','full time','21.00'
'17','4','8am-4pm','full time','20.00'
'18','4','9am-7pm','student','20.00'
'19','4','6am-2pm','full time','24.00'
'20','4','8am-4pm','student','19.00'


Result:
'2','19.00','1'
'3','19.00','1'
'12','19.00','1'
'20','19.00','1'
'1','20.00','5'
'4','20.00','5'
'9','20.00','5'
'13','20.00','5'
'17','20.00','5'
'18','20.00','5'
'11','21.00','11'
'16','21.00','11'
'7','22.00','13'
'14','22.00','13'
'5','23.00','15'
'8','23.00','15'
'6','24.00','17'
'19','24.00','17'
'10','25.00','19'
'15','25.00','19'

*/



-- Windowing in SQL

