/*Oracle - intent of this one is to support in-course visualization answering the question, How many submission attempts are in Needs Grading status in this course?. Alerts instructor to need to grade coursework via alternate workflow. RS2016*/

SELECT 'There are '||NG_COUNT||' submission attempts in a Needs Grading status.' AS MESSAGE FROM(
SELECT 
	CM.COURSE_ID
	,COUNT(am.pk1) AS NG_COUNT
FROM bblearn.ATTEMPT AM
inner JOIN bblearn.GRADEBOOK_GRADE GG
ON AM.GRADEBOOK_GRADE_PK1=GG.PK1
inner JOIN bblearn.GRADEBOOK_MAIN GM
ON GG.GRADEBOOK_MAIN_PK1=GM.PK1
inner JOIN bblearn.COURSE_MAIN CM
ON GM.CRSMAIN_PK1=CM.PK1
WHERE CM.BATCH_UID IN ('AdCourse_79102') --use a variable here, or use course context
AND AM.STATUS=6
GROUP BY CM.COURSE_ID
)
;
/*
SELECT 
	MM.SUBJECT AS ITEM_TITLE
	, USERS.USER_ID
	, CM.COURSE_ID
	, MM.POSTED_DATE
	, MM.LAST_EDIT_DATE	
	, MM.LIFECYCLE
  , FORUM_MAIN.NAME AS PARENT_FORUM_TITLE
--	, MM.POSTED_NAME
	, TRUNC(MM.LAST_EDIT_DATE) AS SUBMIT_DATE
FROM bblearn.MSG_MAIN MM
LEFT OUTER JOIN bblearn.USERS 
  ON MM.USERS_PK1=USERS.PK1
LEFT OUTER JOIN bblearn.FORUM_MAIN FM
  ON MM.FORUMMAIN_PK1=forum_main.PK1
LEFT OUTER JOIN bblearn.CONFERENCE_MAIN 
  ON FORUM_main.CONFMAIN_PK1=conference_main.PK1
LEFT OUTER JOIN bblearn.COURSE_MAIN CM
  ON CONFERENCE_MAIN.CRSMAIN_PK1=CM.PK1
WHERE CM.BATCH_UID IN ('AdCourse_79102')
  AND MM.POSTED_DATE >= SYSDATE-1
  AND FM.TITLE='Ask Your Instructor'
--OPTION: Several useful where clauses
-- WHERE 
--OPTION: Date posted range start
-- MM.POSTED_DATE >= TO_DATE('28-JUL-15 00:00:00', 'DD-MON-YY HH24:MI:SS')
--OPTION: Date posted range end
-- AND MM.POSTED_DATE < TO_DATE('29-JUL-15 00:00:00', 'DD-MON-YY HH24:MI:SS')
--OPTION: completion/lifecycle status. Toggle "PUBLISHED"/"DRAFT"
-- MM.LIFECYCLE = 'PUBLISHED'
--OPTION: Blackboard username. Fill in 'user' between single quotes 
-- AND USERS.USER_ID IN ('example-student1')
--OPTION: External (SIS or other) unique ID between single quotes
-- USERS.BATCH_UID='ID-0001'
--OPTION: Blackboard Course ID 
-- cm.course_id IN ('EXAMPLECOURSE-01','EXAMPLECOURSE-02')
--OPTION: External (SIS or other) unique ID between single quotes 
-- cm.batch_uid IN ('ID-1000','ID-1001')
--OPTION: ORDER BY
-- ORDER BY MM.LAST_EDIT_DATE ASC
;

select * from bblearn.forum_main;

select * from bblearn.course_main where course_id='160627-BC1020-08';

	am.pk1
  ,GM.TITLE AS ITEM_TITLE
  ,US.USER_ID
	,CM.COURSE_ID
	,AM.DATE_ADDED AS CREATED_DATE
	,AM.DATE_MODIFIED AS EDIT_DATE
  ,AM.SCORE
	,CASE AM.STATUS
    WHEN 1 THEN 'Not Attempted'
    WHEN 3 THEN 'In Progress'
    WHEN 4 THEN 'Suspended'
    WHEN 6 THEN 'Needs Grading'
    WHEN 7 THEN 'COMPLETED'
    WHEN 8 THEN 'In More Progress'
    WHEN 9 THEN 'Needs More Grading'
    ELSE 'Other/Deprecated'
  END AS LIFECYCLE 
	,TRUNC(AM.DATE_MODIFIED) AS SUBMIT_DATE
--  ,GM.SCORE_PROVIDER_HANDLE
--	,AM.INSTRUCTOR_NOTES
--	,AM.INSTRUCTOR_COMMENTS
--	,AM.FEEDBACK_FORMAT_TYPE	
FROM bblearn.ATTEMPT AM
inner JOIN bblearn.GRADEBOOK_GRADE GG
ON AM.GRADEBOOK_GRADE_PK1=GG.PK1
inner JOIN bblearn.GRADEBOOK_MAIN GM
ON GG.GRADEBOOK_MAIN_PK1=GM.PK1
inner JOIN bblearn.COURSE_MAIN CM
ON GM.CRSMAIN_PK1=CM.PK1
inner JOIN bblearn.COURSE_USERS CU
ON CM.PK1=CU.CRSMAIN_PK1
inner JOIN bblearn.USERS US
ON CU.USERS_PK1=US.PK1
--WHERE ATTEMPT.ATTEMPT_DATE > TO_DATE('2015-05-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
--AND GM.SCORE_PROVIDER_HANDLE='resource/x-plugin-scormengine'
--AND GM.TITLE='ITM'
WHERE CM.BATCH_UID IN ('AdCourse_77173')
--AND USER_ID='test.t.jeffery1'
--AND USER_ID IN ('p-student1','p-student2','p-student3')
--AND US.BATCH_UID IN ('SyStudent_376652')
AND US.USER_ID='a.mccray7'
AND GM.TITLE ='Week 1 - Assignment'
ORDER BY ITEM_TITLE, SUBMIT_DATE DESC,AM.PK1, USER_ID ASC
;
*/