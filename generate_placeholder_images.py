#!/usr/bin/env python3
"""
爱伴App - 占位图片生成脚本
使用PIL/Pillow创建占位图片
"""

import os
from PIL import Image, ImageDraw, ImageFont

def create_placeholder(width, height, bg_color, text, text_color, filename):
    """创建占位图片"""
    # 创建图片
    img = Image.new('RGB', (width, height), bg_color)
    draw = ImageDraw.Draw(img)
    
    # 尝试使用系统字体，如果失败则使用默认字体
    try:
        # macOS
        font_size = min(width, height) // 4
        font = ImageFont.truetype("/System/Library/Fonts/PingFang.ttc", font_size)
    except:
        try:
            # Windows
            font = ImageFont.truetype("C:\\Windows\\Fonts\\msyh.ttc", font_size)
        except:
            # 使用默认字体
            font = ImageFont.load_default()
    
    # 计算文字位置（居中）
    bbox = draw.textbbox((0, 0), text, font=font)
    text_width = bbox[2] - bbox[0]
    text_height = bbox[3] - bbox[1]
    x = (width - text_width) // 2
    y = (height - text_height) // 2
    
    # 绘制文字
    draw.text((x, y), text, fill=text_color, font=font)
    
    # 保存图片
    img.save(filename, 'JPEG', quality=85)
    print(f"✓ 已创建: {filename}")

def main():
    print("开始生成占位图片...")
    print()
    
    # 确保目录存在
    os.makedirs('assets/images', exist_ok=True)
    os.chdir('assets/images')
    
    # 生成头像图片
    print("生成头像图片...")
    for i in range(1, 5):
        create_placeholder(200, 200, '#E8D5F2', f'A{i}', '#8E2DE2', f'avatar{i}.jpg')
    
    # 生成用户头像
    print("\n生成用户头像...")
    for i in range(1, 5):
        create_placeholder(200, 200, '#F5E8FF', f'U{i}', '#F000FF', f'user{i}.jpg')
    
    # 生成帖子图片
    print("\n生成帖子图片...")
    posts = [
        ('晨曦', '#C8B6E2'),
        ('午后', '#A8D5E2'),
        ('夜景', '#E2C8B6'),
        ('森林', '#B6E2C8'),
    ]
    for i, (text, color) in enumerate(posts, 1):
        create_placeholder(800, 1000, color, text, 'white', f'post{i}.jpg')
    
    # 生成探索图片
    print("\n生成探索图片...")
    explores = [
        ('人像', '#FFE5E5'),
        ('极简', '#E5F5FF'),
        ('街拍', '#FFF5E5'),
        ('街拍', '#E5FFE5'),
        ('静物', '#F5E5FF'),
        ('建筑', '#FFE5F5'),
        ('风光', '#E5FFFF'),
        ('美食', '#FFFFE5'),
    ]
    for i, (text, color) in enumerate(explores, 1):
        create_placeholder(400, 500, color, text, '#666666', f'explore{i}.jpg')
    
    # 生成作品图片
    print("\n生成作品图片...")
    for i in range(1, 10):
        create_placeholder(300, 300, '#F0E5FF', f'作品{i}', '#8E2DE2', f'work{i}.jpg')
    
    # 生成聊天头像
    print("\n生成聊天头像...")
    create_placeholder(200, 200, '#FFE5F0', 'Sarah', '#EC4899', 'chat1.jpg')
    create_placeholder(200, 200, '#E5F0FF', 'David', '#3B82F6', 'chat2.jpg')
    
    # 生成个人资料图片
    print("\n生成个人资料图片...")
    create_placeholder(200, 200, '#F5E5FF', 'Emily', '#8E2DE2', 'profile_avatar.jpg')
    create_placeholder(800, 400, '#E8D5F2', '爱伴', 'white', 'profile_bg.jpg')
    
    print("\n" + "="*50)
    print("✅ 完成！所有占位图片已生成。")
    print("图片位置: assets/images/")
    print("\n现在可以运行: flutter run")
    print("="*50)

if __name__ == '__main__':
    try:
        main()
    except ImportError:
        print("错误: 未找到 Pillow 库")
        print("请先安装: pip install Pillow")
        print("或: pip3 install Pillow")
    except Exception as e:
        print(f"错误: {e}")
