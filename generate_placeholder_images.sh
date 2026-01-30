#!/bin/bash

# 爱伴App - 占位图片生成脚本
# 使用纯色背景和文字创建占位图片

echo "开始生成占位图片..."

cd assets/images || exit

# 检查是否安装了 ImageMagick
if ! command -v convert &> /dev/null; then
    echo "错误: 未找到 ImageMagick"
    echo "请先安装 ImageMagick:"
    echo "  macOS: brew install imagemagick"
    echo "  Ubuntu: sudo apt-get install imagemagick"
    echo "  Windows: 从 https://imagemagick.org 下载"
    exit 1
fi

echo "生成头像图片..."
for i in {1..4}; do
  convert -size 200x200 "xc:#E8D5F2" -gravity center -pointsize 60 -fill "#8E2DE2" -annotate +0+0 "A$i" avatar$i.jpg
done

echo "生成用户头像..."
for i in {1..4}; do
  convert -size 200x200 "xc:#F5E8FF" -gravity center -pointsize 60 -fill "#F000FF" -annotate +0+0 "U$i" user$i.jpg
done

echo "生成帖子图片..."
convert -size 800x1000 "xc:#C8B6E2" -gravity center -pointsize 100 -fill white -annotate +0+0 "晨曦" post1.jpg
convert -size 800x1000 "xc:#A8D5E2" -gravity center -pointsize 100 -fill white -annotate +0+0 "午后" post2.jpg
convert -size 800x1000 "xc:#E2C8B6" -gravity center -pointsize 100 -fill white -annotate +0+0 "夜景" post3.jpg
convert -size 800x1000 "xc:#B6E2C8" -gravity center -pointsize 100 -fill white -annotate +0+0 "森林" post4.jpg

echo "生成探索图片..."
categories=("人像" "极简" "街拍" "街拍" "静物" "建筑" "风光" "美食")
colors=("#FFE5E5" "#E5F5FF" "#FFF5E5" "#E5FFE5" "#F5E5FF" "#FFE5F5" "#E5FFFF" "#FFFFE5")

for i in {1..8}; do
  convert -size 400x500 "xc:${colors[$i-1]}" -gravity center -pointsize 80 -fill "#666666" -annotate +0+0 "${categories[$i-1]}" explore$i.jpg
done

echo "生成作品图片..."
for i in {1..9}; do
  convert -size 300x300 "xc:#F0E5FF" -gravity center -pointsize 60 -fill "#8E2DE2" -annotate +0+0 "作品$i" work$i.jpg
done

echo "生成聊天头像..."
convert -size 200x200 "xc:#FFE5F0" -gravity center -pointsize 50 -fill "#EC4899" -annotate +0+0 "Sarah" chat1.jpg
convert -size 200x200 "xc:#E5F0FF" -gravity center -pointsize 50 -fill "#3B82F6" -annotate +0+0 "David" chat2.jpg

echo "生成个人资料图片..."
convert -size 200x200 "xc:#F5E5FF" -gravity center -pointsize 40 -fill "#8E2DE2" -annotate +0+0 "Emily" profile_avatar.jpg
convert -size 800x400 gradient:"#E8D5F2"-"#F5E8FF" -gravity center -pointsize 80 -fill white -annotate +0+0 "爱伴" profile_bg.jpg

echo "✅ 完成！所有占位图片已生成。"
echo "图片位置: assets/images/"
echo ""
echo "现在可以运行: flutter run"
