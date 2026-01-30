#!/bin/bash

# 添加图片到 iOS 模拟器相册的脚本

echo "📱 正在查找运行中的 iOS 模拟器..."

# 获取当前运行的模拟器 UDID
SIMULATOR_ID=$(xcrun simctl list devices | grep "Booted" | grep -o -E '\([A-F0-9-]+\)' | tr -d '()')

if [ -z "$SIMULATOR_ID" ]; then
    echo "❌ 没有找到运行中的模拟器"
    echo "请先启动 iOS 模拟器"
    exit 1
fi

echo "✅ 找到模拟器: $SIMULATOR_ID"

# 检查是否提供了图片路径
if [ $# -eq 0 ]; then
    echo "📸 使用项目中的示例图片..."
    # 添加项目中的图片到模拟器
    for img in assets/images/*.jpg; do
        if [ -f "$img" ]; then
            echo "  添加: $img"
            xcrun simctl addmedia "$SIMULATOR_ID" "$img"
        fi
    done
else
    # 添加指定的图片
    for img in "$@"; do
        if [ -f "$img" ]; then
            echo "  添加: $img"
            xcrun simctl addmedia "$SIMULATOR_ID" "$img"
        else
            echo "  ⚠️  文件不存在: $img"
        fi
    done
fi

echo "✅ 图片已添加到模拟器相册"
echo "💡 现在可以在应用中选择这些图片了"
