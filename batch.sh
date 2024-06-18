#!/usr/bin/env bash
for file in *.list; do
    dir_name=$(basename "$file" .list)
    mkdir -p "$dir_name"
    # 按行读取网址列表文件，并在循环中打印每个网址
    while IFS= read -r url; do
        if [[ ${url:0:1} == "#" ]]; then
            continue
        fi
        echo "$url"
        yt-dlp --proxy 192.168.1.20:8889 -f "bestvideo[height<=?1080]+bestaudio/best[height<=?1080]" -o "$dir_name/%(title)s.%(ext)s" $url --no-playlist
    done <"$file"
done