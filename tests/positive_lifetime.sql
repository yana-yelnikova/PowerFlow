select * from {{ ref("ltv") }} as l 
where 
        lifetime < 0
