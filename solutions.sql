--query 1

SELECT i.cpu_number, 
       u.host_id, 
       i.total_mem 
FROM   host_info AS i, 
       host_usage AS u 
WHERE  i.id = u.host_id 
ORDER  BY i.total_mem DESC; 

--query 2
select u.host_id, i.hostname, i.total_mem,(i.total_mem-u.memory_free)*100/i.total_mem as used_memory_percentage from host_info i, host_usage u where i.id=u.host_id; 

