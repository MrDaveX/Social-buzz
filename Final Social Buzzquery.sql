
--Aim of these queries is to explore the datasets in each table,remove blanks,nulls,irrelevant columns,incomplete rows and columns
--After cleaning all the table,the three tables will be merged together in a single table
--The aggregate score for each content type will then be calculated
--The Top 5 Content Category will be filtered out in Descending order(from top to bottom)



SELECT *
FROM content

SELECT *
FROM reactions

SELECT *
FROM ReactionTypes

----Content

SELECT *
FROM content


Alter table Content
DROP COLUMN URL

SELECT DISTINCT CATEGORY
FROM content

Alter table Content
DROP COLUMN User_ID

UPDATE Content
SET category = 'Food'
WHERE Category LIKE '"Fo%"'

UPDATE Content
SET category = 'tennis'
WHERE Category LIKE '"tenn%"'

SELECT *,
ROW_NUMBER () OVER ( PARTITION BY Content_ID,
									Type,
									category
									Order By column1 ) Row_num
FROM Content


WITH ContentCTE AS (
SELECT *,
ROW_NUMBER () OVER ( PARTITION BY Content_ID,
									Type,
									category
									Order By column1 ) Row_num
FROM Content
)

SELECT * 
FROM ContentCTE
WHERE ROW_num >1

--ReactionType

Select * 
From ReactionTypes

--Reaction

Select * 
From Reactions

ALTER TABLE Reactions
DROP COLUMN User_ID

SELECT DISTINCT TYPE
FROM REACTIONS

Select * 
From Reactions
WHERE Type is null

DELETE
FROM Reactions
WHERE Type is null

SELECT *,
ROW_NUMBER () OVER ( PARTITION BY Content_ID,
									Type,
									Datetime
									Order By column1 ) Row_num
FROM Reactions

WITH ReactionsCTE AS (
SELECT *,
ROW_NUMBER () OVER ( PARTITION BY Content_ID,
									Type,
									Datetime
									Order By column1 ) Row_num
FROM Reactions
)

SELECT *
FROM ReactionsCTE 
WHERE ROW_num >1

SELECT *
FROM content

SELECT *
FROM reactions

SELECT *
FROM ReactionTypes

ELECT *
FROM Reaction

SELECT *
FROM ReactionTypes

SELECT *
FROM Content

WITH SOCIALCTE AS(
				Select RT.column1,
				RT.Content_ID,
				Content_Type,
				Category,
				reaction_type,
				datetime
FROM Reaction RT
Inner join content CT 
ON 
RT.Content_ID = CT.Content_ID
)

Select ST.*,RY.score
INTO ACCENTURE_NEWS
From SocialCTE ST
Inner Join ReactionTypes RY on 
ST.reaction_type = RY.type

Select category,score--SUM(score)
From ACCENTURE_NEWS
WHERE Category ='studying'
Group By category,score


With topcte as (
select DISTINCT category, SUM(SCORE)Scores
from ACCENTURE_NEWS
Group by category
--order by 2 desc
)

select top 5 category,scores
into top_category
from topcte
order by scores desc

SELECT *
FROM top_category


