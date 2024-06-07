#!/bin/bash

# 指定网址列表文件路径
url_list_file="url_list.txt"
prefix_dir="/mnt/c/Users/zen/Github/FastYt-dlp/clip"
# 按行读取网址列表文件，并在循环中打印每个网址
while IFS= read -r url; do
    if [[ ${url:0:1} == "#" ]]; then
    continue
fi

    echo "$url"
    yt-dlp --proxy 192.168.1.20:8889 -f "bestvideo[height<=?1080]+bestaudio/best[height<=?1080]" -o "${prefix_dir}/%(title)s.%(ext)s" $url --no-playlist
done < "$url_list_file"