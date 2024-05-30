#!/bin/bash

# 指定网址列表文件路径
url_list_file="url_list.txt"

# 按行读取网址列表文件，并在循环中打印每个网址
while IFS= read -r url; do
    if [[ $url == #* ]]; then
        continue
    fi
    echo "$url"
    yt-dlp --proxy 192.168.1.20:8889 $url
done < "$url_list_file"