/*
select 
con.contest_id, 
avg(con.hacker_id) as hacker_id,   
con.name as name, 
SUM(sub.total_submissions) as total_submissions, 
sum(sub.total_accepted_submissions)
,avg(cha.challenge_id)
from contests as con 
inner join colleges as col on con.contest_id=col.contest_id
inner join challenges as cha on col.college_id=cha.college_id
inner join submission_stats as sub on cha.challenge_id= sub.challenge_id
--right join view_stats as vi on vi.challenge_id = sub.challenge_id  and cha.challenge_id= sub.challenge_id
where con.contest_id = '845'
GROUP BY
   con.contest_id, con.name
   --con.name, con.hacker_id, 
   --sub.total_accepted_submissions
   order by con.contest_id asc;
 */
-- sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views
 select col.contest_id,
 con.hacker_id as hacker,
 con.name as name, 
 e.total_submissions,
 e.total_accepted_submissions,
 SUM(vi.total_views) as total_views,
 sum(vi.total_unique_views) as total_unique_views 
 from colleges as col
 left join challenges as cha on col.college_id = cha.college_id
 left join view_stats as vi on cha.challenge_id = vi.challenge_id
 left join contests as con on col.contest_id = con.contest_id
 left join (
    select 
    con.contest_id, 
    SUM(sub.total_submissions) as total_submissions, 
    sum(sub.total_accepted_submissions) as total_accepted_submissions
    from contests as con 
    inner join colleges as col on con.contest_id=col.contest_id
    inner join challenges as cha on col.college_id=cha.college_id
    inner join submission_stats as sub on cha.challenge_id= sub.challenge_id
    GROUP BY con.contest_id, con.name
           ) e ON e.contest_id = col.contest_id
           WHERE vi.total_views IS NOT NULL
GROUP BY
   col.contest_id,con.hacker_id, con.name, e.total_submissions, e.total_accepted_submissions
  order by col.contest_id asc;
