

SELECT * FROM tblclients
WHERE
    
    (select count( tblhosting.id) from tblhosting where tblclients.id=tblhosting.userid limit 1)=0
     and
    (select count( tbldomains.id) from tbldomains where tblclients.id=tbldomains.userid limit 1)=0
