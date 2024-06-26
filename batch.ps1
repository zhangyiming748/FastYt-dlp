# 获取当前目录下的所有.list文件
$files = Get-ChildItem -Filter *.list

foreach ($file in $files) {
    # 获取文件名
    $dir_name = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)

    # 创建目录
    New-Item -ItemType Directory -Path $dir_name -Force | Out-Null

    # 按行读取网址列表文件，并在循环中打印每个网址
    Get-Content $file | ForEach-Object {
        if ($_ -match '^#') {
            continue
        }

        Write-Host $_
        yt-dlp --proxy 192.168.1.20:8889 -f "bestvideo[height<=?1080]+bestaudio/best[height<=?1080]" -o "$dir_name/%(title)s.%(ext)s" $_ --no-playlist
    }
}