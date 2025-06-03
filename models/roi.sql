{{ config(materialized='table')}}

select l.user_id, lifetime, cumulative_daily_rev, channel, campaign_id, 
attribution_cost, DIV0(cumulative_daily_rev, attribution_cost) as roi 
from {{ ref("ltv") }} as l
INNER JOIN {{ ref("users_with_attribution") }} as a
on l.user_id=a.user_id