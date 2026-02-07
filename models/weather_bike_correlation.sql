{{
    config(
        materialized='table'
    )
}}


WITH CTE as (

select
t.*,
w.*
from {{ ref('trip_fact') }} t
left join {{ ref('daily_weather') }} w
on t.TRIP_DATE = w.DAILY_WEATHER


)

SELECT
*
FROM CTE