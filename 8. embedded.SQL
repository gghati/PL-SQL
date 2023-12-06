
-- embedded SQL
EXEC SQL BEGIN DECLARE SECTION;
   char thename[20];
   int age;
EXEC SQL END DECLARE SECTION;
/* assign values value of patient into thename */
EXEC SQL SELECT age 
                   FROM Patients
	                WHERE name =  :thename;


-- embedded SQL - cursor included

EXEC SQL BEGIN DECLARE SECTION 
	char thename; float thecount 
EXEC SQL END DECLARE SECTION

EXEC SQL DECLARE c CURSOR FOR 
	SELECT pname, count(*) 
             FROM Diagnosis
	WHERE diag_date < :thedate	
OPEN CURSOR c
While (1) {
	EXEC SQL FETCH c  into :thename, :thecount
	if (SQLCODE == ‘02000’ break;
             /*format and print name of person and disease (s)he has */
              }
EXEC SQL CLOSE CURSOR c


-- corsor declare
EXEC SQL  declare c cursor for 
         select  name, disease  from Diagnosis
         where diag_date =  :thedate
END_EXEC

-- corsor open
EXEC SQL open c ;

-- cursor fetch
EXEC SQL fetch c into :n, :d END_EXEC

-- cursor close
EXEC SQL close c;
