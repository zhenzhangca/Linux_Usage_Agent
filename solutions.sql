--query 1
SELECT i.cpu_number, 
       u.host_id, 
       i.total_mem 
FROM   host_info AS i, 
       host_usage AS u 
WHERE  i.id = u.host_id 
ORDER  BY i.total_mem DESC; 

--query 2
CREATE 
OR 
replace FUNCTION round_minutes(timestamp without time zone, integer) 
returns timestamp without time zone AS $$
SELECT 
     Date_trunc('hour', $1) + Cast(($2::varchar ||'min') AS INTERVAL) 
     * Round((Date_part('minute',$1)::float + Date_part('second',$1)/ 60.)::float / $2::float))
     $$ language sql immutable;
SELECT
     id, total_mem, avg(((total_mem/1000.0) - memory_free)*100 / (total_mem/1000)) AS "prcnt", round_minutes(u.timestamp, 5) AS "interval" 
FROM       host_info i 
INNER JOIN host_usage u 
ON         i.id = u.host_id 
GROUP BY   id, 
           total_mem, 
           "interval" 
ORDER BY   "interval" ;
