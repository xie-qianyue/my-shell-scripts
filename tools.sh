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

# calculate seconds spent
# https://stackoverflow.com/a/8903280/1165178
SECONDS=0
# do some work
duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."

# read string to array
# https://github.com/dylanaraps/pure-bash-bible#split-a-string-on-a-delimiter
# 上面链接的方法里 read 带了参数 -d ""，不知道是为了什么，在有数的 self-check.sh 里，这个参数会导致最后一个元素跟着一个换行符
IFS=' ' read -ra cid_arr <<< $mysql_cid

# get array length
${#cid_arr[@]}
