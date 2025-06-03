select
    user_id,
    registration_time,
    reg.device_id,
    attribution_time,
    coalesce(channel, 'organic') as channel,
    coalesce(campaign_id, 'organic') as campaign_id,
    coalesce(attribution_cost, 0) as attribution_cost
from {{ ref("registrations_clean") }} as reg
left join {{ ref("marketing_attribution") }} as m on reg.device_id = m.device_id
