create or alter function DOC_ABBREVIATION (
DOCTITLE varchar(1000),
DOCNUMBER varchar(1000))
returns varchar(1000)
as
begin
return
replace(
replace(
replace(
left(split_string(DOCTITLE,' ',1),1)||
left(split_string(DOCTITLE,' ',2),1)||
left(split_string(DOCTITLE,' ',3),1)
,'(','')
,')','')
,' - ','')
||' '
||DOCNUMBER;
end;

-- 0 row(s) affected.