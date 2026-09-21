with ratio as (
    select user_id,
        avg(
            (
                case action
                when 'confirmed' then 1
                else 0
                end
            )
        ) as confirmation_rate

    from confirmations

    group by user_id
)

select s.user_id, round(coalesce(r.confirmation_rate,0), 2) as confirmation_rate
from signups as s
left join ratio as r
on s.user_id = r.user_id
