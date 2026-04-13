with reports as (
    select *
    from students
    cross join subjects
)
, counts as (
    select student_id, subject_name, count(*)
    from examinations
    group by student_id, subject_name
)

select r.student_id, r.student_name, r.subject_name, coalesce(c.count, 0) as attended_exams
from reports as r
left join counts as c
on r.student_id  = c.student_id and r.subject_name = c.subject_name
order by student_id, subject_name
