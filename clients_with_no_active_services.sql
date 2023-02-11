SELECT * FROM tblclients
WHERE
    
(select count( tblhosting.id) from tblhosting where tblclients.id=tblhosting.userid and tblhosting.domainstatus='Active')=0
and  
(select count( tbldomains.id) from tbldomains where tblclients.id=tbldomains.userid and tbldomains.status='Active')=0  
