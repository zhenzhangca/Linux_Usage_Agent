## Introductio
Cluster Monitor Agent is an internal tool that monitors the cluster resources, like the hardware specification, resources usage, etc. It helps the infrastrcture team to persist the data into a RDMS database, so that the user can understand cluster usage and plan for cluster growth.

## Architecture and Design
1) Draw a cluster diagram with three Linux hosts, a DB, and angents
2) Describe tables (no SQL code, just explain their usage)
3) Describe scripts (no code, just explain their usage)

## Usage
1) how to init database and tables

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
