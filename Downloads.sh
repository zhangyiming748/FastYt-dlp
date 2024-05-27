#!/bin/bash

# 读取网址列表文件
url_list="url_list.txt"

# 按行读取网址列表
while IFS= read -r url
do
  # 在这里处理每个网址，例如访问网址、下载内容等
  echo "处理网址： $url"
  yt-dlp --proxy 192.168.1.20:8889 --no-playlist $url
done < "$url_list"

extension="mp4"
for file in *.$extension; do
    new_file=$(echo "$file" | sed 's/ \[.*\]//g' | sed 's/[][]//g')
    mv "$file" "$new_file"
done