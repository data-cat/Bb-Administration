/* Oracle. Returns user-course association and status. */

select 
  user_id
  ,cu.pk1 course_users_pk
  , cu.role
  , cu.available_ind
  , CASE 
      WHEN cu.row_status=0 THEN 'ENABLED'
      ELSE 'DISABLED/OTHER'
    END EnrollStatus
  , cm.course_id
  , cm.dtcreated
  ,u.pk1 users_pk1
  ,u.batch_uid users_batch
  ,cm.pk1 course_pk1
  ,cm.batch_uid course_batch
  ,ds.pk1
from bblearn.course_users cu
inner join bblearn.users u
on cu.users_pk1=u.pk1
left outer join bblearn.course_main cm
on cu.crsmain_pk1=cm.pk1
inner join bblearn.data_source ds
on cu.data_src_pk1=ds.pk1
  where user_id IN('sample.userid')
  order by user_id, cu.role, cm.course_id
; 
