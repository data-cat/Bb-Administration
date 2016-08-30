/*
ORACLE. Gradable item status for user/course on given date range.  
*/

SELECT 
   date_logged
  ,gl.username
  ,gl.grade
  ,gl.deletion_event_ind
  ,attempt_creation
  ,modifier_role
  ,modifier_username
  ,event_key
  ,gm.title
  ,gm.score_provider_handle
  ,cm.course_id
FROM BBLEARN.GRADEBOOK_LOG GL
LEFT OUTER JOIN BBLEARN.GRADEBOOK_MAIN GM
ON GL.GRADEBOOK_MAIN_PK1=GM.PK1
LEFT OUTER JOIN BBLEARN.COURSE_MAIN CM
ON gm.CRSMAIN_PK1=CM.PK1
WHERE DATE_LOGGED >= TO_DATE('10-MAY-15 22:58:21', 'DD-MON-YY HH24:MI:SS')
AND DATE_LOGGED <= TO_DATE('20-MAY-15 22:58:21', 'DD-MON-YY HH24:MI:SS')
--AND GL.MODIFIER_ROLE='S'
AND GL.USERNAME IN ('p-student1','p-student2','p-student3')
--AND CM.BATCH_UID IN (' ')
;
