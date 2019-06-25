## Introductio
Cluster Monitor Agent is an internal tool that monitors the cluster resources, like the hardware specification, resources usage, etc. It helps the infrastrcture team to persist the data into a RDMS database, so that the user can understand cluster usage and plan for cluster growth.

## Architecture and Design
1) Draw a cluster diagram with three Linux hosts, a DB, and angents
![image](https://github.com/zhenzhangca/Linux_Usage_Agent/blob/master/img-folder/Untitled%20Diagram.jpg)
2) Describe tables (no SQL code, just explain their usage)
Create two tables -- host_info and host_usage. Host_info is used to persist hardware specifications, and host_usage is used to persist server CPU and memory data.
3) Describe scripts (no code, just explain their usage)
Create two scripts--host_info.sh and host_usage.sh. Host_info.sh is used to collect hardware information and persist data into host_info table. Host_usage.sh is used to collect CPU and memory data and persist data to the database. Meanwhile, this script will be called by a scheduler periodically(every minute).

## Usage
1) how to init database and tables
Run init.sql once to create database and tables.
2) 'host_info.sh' usage
Create a new file ${work_dir}/linux_sql/host_agent/host_info.sh, then implement the script using ./host_info.sh localhost 5432 host_agent postgres password
3) 'host_usage.sh' usage
Create a new file ${work_dir}/linux_sql/host_agent/host_usage.sh, then implement the script using ./host_usage.sh localhost 5432 host_agent postgres password
4) crontab setup
Create a crontab job that triggers host_usage.sh every minute using crontab -e, edit the crontab then verify the result

## Improvments
Write at least three things you want to improve
e.g.
1) handle hardware update
......
