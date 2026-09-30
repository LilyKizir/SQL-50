-- # Write your MySQL query statement below
-- with player_logins as (
--     select distinct
--         player_id
--         ,event_date
--     from activity
-- )
-- , num_players as (
--     select count( distinct player_id) as count from activity
-- )
-- , flags as (
--     select 
--         player_id
--         ,event_date
--         , row_number() over (partition by player_id order by event_date asc) as first_login_flag
--         , (lead(event_date, 1) over (partition by player_id order by event_date asc)) = date_add(event_date, INTERVAL 1 day) as logged_in_again_next_day_flag
--     from player_logins
-- )
-- select
--     round(sum(first_login_flag and logged_in_again_next_day_flag)/count, 2) as fraction
-- from flags
-- join num_players;

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