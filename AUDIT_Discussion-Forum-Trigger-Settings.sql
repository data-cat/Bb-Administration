/*
Oracle. Audit tool for setting non-compliance with centralized course dev standards. Looking for any discussion forum with a Needs Grading trigger count > 1.
*/
select cm.batch_uid, cm.course_id, gm.title, ic.trigger_count 
from bblearn.interactive_count_col_def ic 
join bblearn.gradebook_main gm on gm.pk1 = ic.gradebook_main_pk1
join bblearn.course_main cm on cm.pk1 = gm.crsmain_pk1
where (cm.course_id LIKE '1503%' OR cm.course_id LIKE '150209-%')
  and ic.trigger_count <> 1
  and cm.row_status = 0 
  and gm.linkrefid in (select registry_value 
      from bblearn.forum_registry 
      where registry_key = 'FORUM_GRADE_HANDLE' 
      and forummain_pk1 in (select 
        forummain_pk1 
        from bblearn.forum_registry 
        where registry_key = 'ALLOW_FORUM_GRADING' 
        and registry_value = 'Y')) 
        ORDER BY COURSE_ID;