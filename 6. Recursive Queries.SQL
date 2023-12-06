
/*

Employee Table: 
'1','Suma',NULL
'2','Shambhu','1'
'3','Gaurav','2'
'4','Sakti','1'
'5','Nitin','1'
'6','Rehan','4'
'7','Shivani','6'
'8','Nikhil','5'
'9','Jyothika','5'

Result of recursive query:
employee_id, employee_name, boss_id, boss_name, depth
'1','Suma',NULL,'Suma','0'
'2','Shambhu','1','Suma','1'
'4','Sakti','1','Suma','1'
'5','Nitin','1','Suma','1'
'3','Gaurav','2','Shambhu','2'
'6','Rehan','4','Sakti','2'
'8','Nikhil','5','Nitin','2'
'9','Jyothika','5','Nitin','2'
'7','Shivani','6','Rehan','3'

*/

with recursive employeeswithboss (
	employee_id,
    employee_name,
    boss_id,
    boss_name,
    depth
) as (
	select employee_id, employee_name, boss_id, employee_name as boss_name, 0 as depth from employee
    where boss_id is NULL
    UNION ALL
    select emp.employee_id, emp.employee_name, emp.boss_id, ewb.employee_name as boss_name, ewb.depth + 1 as depth
		from employee emp
		join employeeswithboss ewb
        on emp.boss_id = ewb.employee_id
)
select *
from employeeswithboss
order by depth;
