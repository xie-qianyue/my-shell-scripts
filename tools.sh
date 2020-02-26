# echo date
date1=`date "+%Y-%m-%d %T"`
date2=`date +%Y-%m-%d-%H%M%S`

# split string by pattern
version="6.2"
echo "${verion/.}"

# cut string
echo "Docker Root Dir: /data/docker" | cut -f 2 -d ":"

# get column by awk
# df -h /var/lib/docker
# 文件系统        容量  已用  可用 已用% 挂载点
# /dev/sdb3       931G  123G  808G   14% /data
df -h /var/lib/docker | tail -1 | awk '{print $5}'

# check if argument exists
if [ -z "$1" ]; then
    echo "No argument supplied"
fi
