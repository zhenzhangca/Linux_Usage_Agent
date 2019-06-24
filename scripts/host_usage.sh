#! /bin/bash

#Setup arguments
psql_host=$1
port=$2
db_name=$3
user_name=$4
password=$5


get_memory_free (){
   memory_free=$(vmstat --unit M | tail -1 | awk '{print $4}' | xargs)
}

get_cpu_idel () {
  cpu_idel=$(vmstat -t | tail -1 | awk '{print $15}' | xargs)
}

#Helper founction
get_less_value(){
  pattern=$1
  value=$(echo "$less" | egrep "$pattern" | awk -F':' '{print $2}' | xargs)
  echo "value=$value"
}

get_cpu_kernel(){
  cpu_kernel=$(vmstat --unit M | tail -1 | awk '{print $14}' | xargs)
}

get_disk_io(){
  disk_io=$(vmstat -d | tail -1 | awk '{print $10}' | xargs)
}

get_disk_available(){
  disk_available=$(df -BM | head -2 | tail -1 |  awk '{print $4}'| sed s/.$// | xargs)
}


#Step1:parse data and setup variables
timestamp=$(date "+%Y-%m-%d %H:%M:%S")
get_memory_free
get_cpu_idel
get_cpu_kernel
get_disk_io
get_disk_available

#Step2:construct INSERT statement
insert_stmt=$(cat <<-END
INSERT INTO host_usage ("timestamp", memory_free, cpu_idel, cpu_kernel, disk_io, disk_available) VALUES ('${timestamp}', ${memory_free}, ${cpu_idel}, ${cpu_kernel}, ${disk_io}, ${disk_available});
END
)
echo $insert_stmt

#Step3:Execute INSERT statement
export PGPASSWORD=$password
psql -h $psql_host -p $port -U $user_name -d $db_name -c "$insert_stmt"
sleep 1

