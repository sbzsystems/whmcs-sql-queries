SELECT 
 
mdm.domain,
mdm.firstpaymentamount,
mdm.recurringamount,

 
(
SELECT 
   
(case when prc.msetupfee=-1 then prc.qsetupfee else prc.msetupfee end) 

FROM `tbldomainpricing` dpr
left join tblpricing prc on prc.relid=dpr.id and  prc.type='domainregister' and prc.currency=1  
where mdm.domain like concat('%',dpr.extension)
    LIMIT 1
) price

,
(case when 
 
(
SELECT 
   
(case when prc.msetupfee=-1 then prc.qsetupfee else prc.msetupfee end) 

FROM `tbldomainpricing` dpr
left join tblpricing prc on prc.relid=dpr.id and  prc.type='domainregister' and prc.currency=1  
where mdm.domain like concat('%',dpr.extension)
    LIMIT 1
) 
 
 <>(mdm.firstpaymentamount+mdm.recurringamount)/2 then 'ΔΙΑΦΟΡΑ ΤΙΜΗΣ' else '' end) info


FROM `tbldomains` mdm