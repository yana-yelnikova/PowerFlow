SELECT  user_id, registration_time,reg.device_id,
attribution_time, COALESCE(channel, 'organic') as channel, 
COALESCE(campaign_id,'organic') as campaign_id,
COALESCE(attribution_cost, 0) as attribution_cost
from {{ ref("registrations_clean") }} as reg
LEFT JOIN {{ ref("marketing_attribution") }} as m
on reg.device_id=m.device_id