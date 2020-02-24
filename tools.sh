# echo date
date1=`date "+%Y-%m-%d %T"`
date2=`date +%Y-%m-%d-%H%M%S`

# split string by pattern
version="6.2"
echo "${verion/.}"

# cut string
echo "Docker Root Dir: /data/docker" | cut -f 2 -d ":"

# check if argument exists
if [ -z "$1" ]; then
    echo "No argument supplied"
fi
