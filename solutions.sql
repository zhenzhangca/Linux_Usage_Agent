--query 1
select i.cpu_number,u.host_id, i.total_mem from host_info as i, host_usage as u  where i.id = u.host_id order by i.total_mem desc;
--query 2
select u.host_id, i.hostname, i.total_mem,(i.total_mem-u.memory_free)*100/i.total_mem as used_memory_percentage from host_info i, host_usage u where i.id=u.host_id; 

