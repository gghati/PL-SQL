
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


-- Dynamic SQL
EXEC SQL BEGIN DECLARE SECTION;
varchar sqlstring[256];
EXEC SQL END DECLARE SECTION;
.........
prompt (“Enter update command:“, sqlstring);
EXEC SQL PREPARE sqlcommand FROM :sqlstring;
EXEC SQL EXECUTE sqlcommand

- combine prepare and exec
Exec SQL execute Immediate :sqlstring;


-- Call level interface
SQLPrepare(handle_1, “Select name from Patients”);
SQLExecute (handle_1)


-- prepare statement JDBC
PreparedStatement pStmt = conn.prepareStatement("insert into instructor values(?,?,?,?)");
pStmt.setString(1, "88877");
pStmt.setString(2, "Perry");
pStmt.setString(3, "Finance");
pStmt.setInt(4, 125000);
pStmt.executeUpdate();
pStmt.setString(1, "88878");
pStmt.executeUpdate();


--RDF Query 
select ?name
where {
      ?cid title "Intro. to Computer Science" .
      ?sid sec_course ?cid .
      ?id takes ?sid .
      ?id name ?name .
} 
