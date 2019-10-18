#!/bin/bash

# MySQL 备份脚本
# 使用方法：
# 1、输入命令 crontab -e 打开 cron 编辑器
# 2、在最后一行追加 0 2 * * * /bin/sh /backup_file_path/backup_single.sh
# 3、保存退出

BACKUP_PATH="/some_backup_path"
mkdir -p ${BACKUP_PATH}

DATE_POSTFIX=`date +"%Y-%m-%d_%H-%M-%S"`

docker exec $(docker ps | grep mysql | cut -f 1 -d ' ') mysqldump --single-transaction --set-gtid-purged=OFF youdata > ${BACKUP_PATH}/backup-${DATE_POSTFIX}.sql

# if bin_log is open
# docker exec $(docker ps | grep mysql | cut -f 1 -d ' ') mysqldump --single-transaction --set-gtid-purged=OFF --master-data=2 youdata > ${BACKUP_PATH}/backup-${DATE_POSTFIX}.sql

# 删除5天前的备份
find ${BACKUP_PATH} -mtime +5 -type f -delete
