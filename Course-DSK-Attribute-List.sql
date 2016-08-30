/*
Oracle. List all courses with Data Source. Filter as needed. Helpful base query for monitoring automated course creation processes generating new DSKs
*/

SELECT 
  CM.COURSE_ID
  ,CM.AVAILABLE_IND
  ,CASE 
    WHEN CM.ROW_STATUS = 0 THEN 'ENABLED'
    WHEN CM.ROW_STATUS=2 THEN 'DISABLED'
    ELSE 'OTHER'
    END AS rwstatus
  ,DS.BATCH_UID
FROM BBLEARN.COURSE_MAIN CM
INNER JOIN BBLEARN.DATA_SOURCE DS
  ON CM.data_src_pk1 = DS.pk1
WHERE CM.SERVICE_LEVEL='F'
--AND ROWNUM<100
;
  
  