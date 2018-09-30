-- Punto 2

    -- A
    CREATE TABLESPACE uber 
    DATAFILE 'C:\Users\BGinvestments\Desktop\uber\uber.dbf' SIZE 2G;
    
    --B     
    CREATE UNDO TABLESPACE uberundo 
    DATAFILE 'C:\Users\BGinvestments\Desktop\uber\uberundo.dbf' SIZE 2G;
    
    --C         
    CREATE BIGFILE TABLESPACE uberbigfile
    DATAFILE 'C:\Users\BGinvestments\Desktop\uber\uberbigfile.dbf' SIZE 5G;
    
    --D
    ALTER SYSTEM SET UNDO_TABLESPACE= uberundo;

-- Punto 3
    CREATE USER dba_uber
    IDENTIFIED BY dba_uber
    DEFAULT TABLESPACE uber;
    GRANT CREATE SESSION TO dba_uber;
    	
    GRANT  DBA TO dba_uber;

-- Punto 4
    CREATE PROFILE clerk LIMIT 
    PASSWORD_LIFE_TIME               40   
    SESSIONS_PER_USER                1   
    IDLE_TIME                        10   
    FAILED_LOGIN_ATTEMPTS            4;  
    
    CREATE PROFILE development LIMIT 
    PASSWORD_LIFE_TIME               100   
    SESSIONS_PER_USER                2   
    IDLE_TIME                        30   
    FAILED_LOGIN_ATTEMPTS            unlimited; 
    
-- Punto 5
    CREATE USER user1
    IDENTIFIED BY user1
    DEFAULT TABLESPACE uber;
    
    CREATE USER user2
    IDENTIFIED BY user2
    DEFAULT TABLESPACE uber;
    
    CREATE USER user3
    IDENTIFIED BY user3
    DEFAULT TABLESPACE uber;
    
    CREATE USER user4
    IDENTIFIED BY user4
    DEFAULT TABLESPACE uber;

    ALTER USER user1 PROFILE clerk;
    ALTER USER user2 PROFILE clerk;
    ALTER USER user3 PROFILE development;
    ALTER USER user4 PROFILE development;
    ALTER USER user2 ACCOUNT LOCK;
    
    
    
    