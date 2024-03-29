# 1.
SELECT *
   ,ROUND(Age_18___34 + Age_35___64+Age_65_and_up,2) AS count
FROM `inductive-seat-389220.course12.survey2` 
 WHERE REGEXP_CONTAINS(Questions,'In general, how masculine or "manly" do you feel?') 
ORDER BY count DESC
-- OR
SELECT *
 FROM `inductive-seat-389220.course12.survey2` 
 WHERE REGEXP_CONTAINS(Questions,'In general, how masculine or "manly" do you feel?')
ORDER BY adult_men DESC

# 2.
SELECT 
  Questions,
  adult_men,
  age_18___34,
  age_35___64,
  age_65_and_up,
  ROUND(age_18___34 - adult_men,2) AS new_18_34,
  ROUND(age_35___64 - adult_men,2) AS new_35_64,
  ROUND(age_65_and_up - adult_men,2) AS new_65_up,
FROM `inductive-seat-389220.course12.survey2` 
WHERE REGEXP_CONTAINS(questions,'Feel lonely or isolated')