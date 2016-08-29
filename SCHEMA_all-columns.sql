/*Oracle. Lists all fields in range for reference. Comment AND filter LIKE BBGS to include custom tables.*/

SELECT atc.owner, atc.table_name, atc.column_name, atc.data_type, acc.comments
FROM all_tab_columns atc
  INNER JOIN all_col_comments acc 
   ON atc.table_name = acc.table_name 
    AND atc.column_name = acc.column_name 
    AND atc.owner = acc.owner
  WHERE atc.owner NOT IN  ('SYS','SYSTEM')
  AND atc.table_name LIKE 'BBGS%'
ORDER BY atc.owner, atc.table_name, atc.column_name ASC;


