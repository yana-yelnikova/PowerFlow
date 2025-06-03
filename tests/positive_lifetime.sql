-- This query selects all records from the `ltv` model where the `lifetime` value (number of days between registration and purchase) is less than 0.
-- Such cases likely indicate data issues, for example, if a purchase date is earlier than the user's registration date.
-- This can be useful for debugging or cleaning the data before final ROI calculations.
select * from {{ ref("ltv") }} as l 
where 
        lifetime < 0
