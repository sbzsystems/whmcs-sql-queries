-- clean subscribers PHPjabbers PHP Newsletter Script

DELETE FROM `nlnewsletter_subscribers`
where  `nlnewsletter_subscribers`.id not IN
(SELECT  `nlnewsletter_groups_subscribers`.`subscriber_id` FROM `nlnewsletter_groups_subscribers` );


delete FROM `nlnewsletter_groups_subscribers` 
where `nlnewsletter_groups_subscribers`.`subscriber_id` not in
(SELECT  `nlnewsletter_subscribers`.`id` FROM `nlnewsletter_subscribers` );



 