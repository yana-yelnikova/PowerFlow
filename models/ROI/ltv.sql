with reg as
(SELECT  DISTINCT user_id,   DATE(min(registration_time)) as reg_date
from {{ ref("registrations_clean") }}
GROUP BY user_id),
daily_purch as (
SELECT user_id, DATE(transaction_time) as transaction_date,
 sum(total_value) as daily_rev
from {{source("powerflow",'transactions')}}
GROUP BY user_id, transaction_date)

SELECT p.user_id, transaction_date, reg_date,
DATEDIFF(DAY, reg_date, transaction_date) AS lifetime,
daily_rev,
SUM(daily_rev) OVER (PARTITION BY p.user_id ORDER BY p.transaction_date) AS cumulative_daily_rev
from
daily_purch as p
left join reg as r  on p.user_id=r.user_id
ORDER BY p.user_id, transaction_date