## Introduction
Cluster Monitor Agent is an internal tool that monitors the cluster resources, like the hardware specification, resources usage, etc. It helps the infrastrcture team to persist the data into the corresponding tables in the PostgreSQL RDBMS, so that the users can understand cluster usage and plan for cluster growth.

## Architecture and Design
1) Cluster diagram:
![image](https://github.com/zhenzhangca/Linux_Usage_Agent/blob/master/img-folder/Untitled%20Diagram.jpg)
2) Tables
Create a databae called 'host_agent' in the PostgreSQL RDBMS, then create two tables called `host_info` and `host_usage` in the `host_agent` database.   
- `host_info` table is used to persist hardware specifications.  
- `host_usage` table is used to persist server CPU and memory data.
3) Bash scripts
Create two bash scripts called `host_info.sh` and `host_usage.sh` for the Cluster Monitor Agent.  
- `host_info.sh` is used to collect hardware information and persist those information into `host_info` table in the database.   
- `host_usage.sh` is used to collect CPU and memory data and persist those data into `host_usage` table in the database. Meanwhile, this bash script will be called by a scheduler periodically(e.g. a crontab job that runs this script every minute).

## Usage
1) Init database and tables
Create a new SQL file `/home/centos/dev/jrvs/bootcamp/linux_sql/host_agent/scripts/init.sql`, then run this SQL file for once to create `host_agent` database, 'host_info` and `host_usage` tables.
2) Implement 'host_info.sh' script
Create a new bash script file `/home/centos/dev/jrvs/bootcamp/linux_sql/host_agent/scripts/host_info.sh`, then implement this script using command line `./host_info.sh localhost 5432 host_agent postgres password`.
3) Implement 'host_usage.sh' script
Create a new bash script file `/home/centos/dev/jrvs/bootcamp/linux_sql/host_agent/scripts/host_usage.sh`, then implement this script using command line `./host_usage.sh localhost 5432 host_agent postgres password`.
4) Crontab setup
- Create a `crontab` job using command line `crontab -e`.  
- Edit the crontab to trigger `host_usage.sh` every minute as follows:  
`* * * * * bash  
/home/centos/dev/jrvs/bootcamp/linux_sql/host_agent/scripts/host_usage.sh localhost 5432 host_agent postgres password > /tmp/host_usage.log`

## Improvments
Write at least three things you want to improve
e.g.
1) handle hardware update
......
