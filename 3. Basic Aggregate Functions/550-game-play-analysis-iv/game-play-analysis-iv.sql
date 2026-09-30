with player_logins as (
    select distinct
        player_id
        ,event_date
    from activity
)
, day2s as (
    select 
        event_date = date_add(min(event_date) over (partition by player_id), INTERVAL 1 day) as day2_login
    from player_logins
)
, counter as (select count(distinct player_id) as counter from player_logins)
select
    round(sum(day2_login)/counter, 2) as fraction
from day2s
join counter