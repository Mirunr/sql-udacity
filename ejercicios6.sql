/* 2) You may have noticed that in the previous solution some of the company names include spaces, which will certainly not work in an email address. See if you can create an email address that will work by removing all of the spaces in the account name, but otherwise your solution should be just as in question 1. Some helpful documentation is here(opens in a new tab).
*/
WITH t1 AS (
          SELECT 
          RIGHT(a.primary_poc, LENGTH(a.primary_poc) - POSITION(' ' IN a.primary_poc)) last_name, REPLACE(a.name, ' ','') name , LEFT(a.primary_poc, POSITION(' ' IN a.primary_poc)-1) first_name              
          FROM accounts a)
           
SELECT CONCAT(t1.first_name,'.',t1.last_name, '@',  t1.name, '.com')
FROM t1

/* 3) 
We would also like to create an initial password, which they will change after their first log in. The first password will be the first letter of the primary_poc's first name (lowercase), then the last letter of their first name (lowercase), the first letter of their last name (lowercase), the last letter of their last name (lowercase), the number of letters in their first name, the number of letters in their last name, and then the name of the company they are working with, all capitalized with no spaces.
*/
WITH t1 AS (
          SELECT 
          RIGHT(a.primary_poc, LENGTH(a.primary_poc) - POSITION(' ' IN a.primary_poc)) last_name, REPLACE(a.name, ' ','') name , LEFT(a.primary_poc, POSITION(' ' IN a.primary_poc)-1) first_name              
          FROM accounts a)
           
SELECT CONCAT(LOWER(RIGHT(t1.first_name,1)),LOWER(LEFT(t1.first_name,1)),
       LOWER(RIGHT(t1.last_name,1)),LOWER(LEFT(t1.last_name,1)), LENGTH(t1.first_name), LENGTH(t1.last_name), UPPER(t1.name))
                                                                                           
FROM t1
