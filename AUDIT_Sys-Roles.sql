select 
  U.USER_ID
  ,SR.SYSTEM_ROLE
from bblearn.system_roles SR
inner join bblearn.users U on U.system_role = SR.system_role
where SR.system_role LIKE 'APPLICATION_DEVELOPMENT%';

select * from bblearn.system_roles;

select * from bblearn.users;