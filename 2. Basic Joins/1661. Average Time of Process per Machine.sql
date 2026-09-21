WITH start_times AS (
    SELECT *
    FROM activity
    WHERE activity_type = 'start'
),
end_times AS (
    select *
    from activity
    where activity_type = 'end'
)

select s.machine_id, round(avg(e.timestamp - s.timestamp)::numeric , 3) as processing_time
from start_times as s
join end_times as e
on s.machine_id = e.machine_id and s.process_id = e.process_id
group by s.machine_id
