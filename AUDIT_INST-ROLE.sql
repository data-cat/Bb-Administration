SELECT
	U.LASTNAME
	,U.FIRSTNAME
	,U.USER_ID
	,U.ROW_STATUS
	,U.AVAILABLE_IND
	,U.EMAIL
  ,IR2.ROLE_NAME
--  ,SUBSTR(IR2.ROLE_NAME,0,5) ""Primary Role""
	,IR.ROLE_NAME
	,U.SYSTEM_ROLE
	,DS.DESCRIPTION
FROM BBLEARN.USERS U
	INNER JOIN BBLEARN.DATA_SOURCE DS
  	ON U.DATA_SRC_PK1=DS.PK1
  LEFT OUTER JOIN BBLEARN.USER_ROLES UR
    ON U.PK1=UR.USERS_PK1
  LEFT OUTER JOIN BBLEARN.INSTITUTION_ROLES IR
    ON UR.INSTITUTION_ROLES_PK1=IR.PK1
  LEFT OUTER JOIN BBLEARN.INSTITUTION_ROLES IR2
    ON U.INSTITUTION_ROLES_PK1=IR2.PK1
WHERE U.ROW_STATUS=0
  AND U.AVAILABLE_IND = 'Y'
  AND IR.ROLE_NAME IN ('Instructional Designer','ID_Vendors')
;

select * from bblearn.institution_roles;

