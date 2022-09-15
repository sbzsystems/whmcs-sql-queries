UPDATE tbldomains SET recurringamount = 

IFNULL((
SELECT 
case when tbldomains.userid=22 then 
(
(case when msetupfee=0 then qsetupfee else msetupfee end)
-15 *
(case when msetupfee=0 then qsetupfee else msetupfee end)
/100) else 
(case when msetupfee=0 then qsetupfee else msetupfee end)
end

FROM tblpricing ,tbldomainpricing
where tblpricing.type='domainrenew' and tblpricing.relid=tbldomainpricing.id
and currency=1
and qsetupfee>0 
and extension = SUBSTRING(tbldomains.domain, POSITION('.' IN tbldomains.domain),10)
), 0)