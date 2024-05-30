#!/bin/bash

# shell脚本实现获取指定文件夹下的指定扩展名文件 并且使用sed命令批量替换 4k修复 字段为空 执行这个重命名操作
# 指定文件夹路径和文件扩展名
folder_path="/mnt/f/alist/bilibili/颤抖的酸黄瓜"
file_extension=".mkv"

# 查找指定文件夹下的所有指定扩展名的文件，并使用sed命令批量替换文件名中的"4k修复"字段为空
# find "$folder_path" -type f -name "*$file_extension" | while read file; do mv "$file" "$(echo "$file" | sed 's/ \./\./g')"; done
# shellcheck disable=SC2001
find "$folder_path" -type f -name "*$file_extension" | while read file; do mv "$file" "$(echo "$file" | sed 's/\[.*\]//g')"; done

