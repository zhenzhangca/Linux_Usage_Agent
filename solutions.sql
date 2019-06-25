--quiry 1
select i.cpu_number,u.host_id, i.total_mem from host_info as i, host_usage as u  where i.id = u.host_id order by i.total_mem desc;

