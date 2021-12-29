

SELECT * FROM tblclients
WHERE
    
    (select count( tblhosting.id) from tblhosting where tblclients.id=tblhosting.userid)=0
     and
    (select count( tbldomains.id) from tbldomains where tblclients.id=tbldomains.userid)=0
