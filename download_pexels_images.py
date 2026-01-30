#!/usr/bin/env python3
"""
从 Pexels 下载图片资源
使用 Pexels API 下载高质量摄影图片
"""

import os
import urllib.request
import time

def download_image(url, filename):
    """下载图片"""
    try:
        headers = {
            'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36'
        }
        req = urllib.request.Request(url, headers=headers)
        
        with urllib.request.urlopen(req) as response:
            with open(filename, 'wb') as out_file:
                out_file.write(response.read())
        print(f"✓ 已下载: {filename}")
        return True
    except Exception as e:
        print(f"✗ 下载失败 {filename}: {e}")
        return False

def main():
    print("从 Pexels 下载图片资源...")
    print("=" * 60)
    
    # 确保目录存在
    os.makedirs('assets/images', exist_ok=True)
    os.chdir('assets/images')
    
    # Pexels 免费图片 URL（使用小尺寸以加快下载）
    images = {
        # 头像图片 - 非人物（动物、植物、风景等） (200x200)
        'avatar1.jpg': 'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=200&h=200&fit=crop',  # 猫
        'avatar2.jpg': 'https://images.pexels.com/photos/1805164/pexels-photo-1805164.jpeg?auto=compress&cs=tinysrgb&w=200&h=200&fit=crop',  # 花
        'avatar3.jpg': 'https://images.pexels.com/photos/1661179/pexels-photo-1661179.jpeg?auto=compress&cs=tinysrgb&w=200&h=200&fit=crop',  # 狗
        'avatar4.jpg': 'https://images.pexels.com/photos/1133957/pexels-photo-1133957.jpeg?auto=compress&cs=tinysrgb&w=200&h=200&fit=crop',  # 植物
        
        # 用户头像 - 非人物 (200x200)
        'user1.jpg': 'https://images.pexels.com/photos/1906157/pexels-photo-1906157.jpeg?auto=compress&cs=tinysrgb&w=200&h=200&fit=crop',  # 鸟
        'user2.jpg': 'https://images.pexels.com/photos/1805164/pexels-photo-1805164.jpeg?auto=compress&cs=tinysrgb&w=200&h=200&fit=crop',  # 花
        'user3.jpg': 'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=200&h=200&fit=crop',  # 猫
        'user4.jpg': 'https://images.pexels.com/photos/1133957/pexels-photo-1133957.jpeg?auto=compress&cs=tinysrgb&w=200&h=200&fit=crop',  # 植物
        
        # 帖子图片 (800x1000, 4:5比例)
        'post1.jpg': 'https://images.pexels.com/photos/1287145/pexels-photo-1287145.jpeg?auto=compress&cs=tinysrgb&w=800&h=1000&fit=crop',
        'post2.jpg': 'https://images.pexels.com/photos/1366919/pexels-photo-1366919.jpeg?auto=compress&cs=tinysrgb&w=800&h=1000&fit=crop',
        'post3.jpg': 'https://images.pexels.com/photos/1486222/pexels-photo-1486222.jpeg?auto=compress&cs=tinysrgb&w=800&h=1000&fit=crop',
        'post4.jpg': 'https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg?auto=compress&cs=tinysrgb&w=800&h=1000&fit=crop',
        
        # 探索图片 (400x500)
        'explore1.jpg': 'https://images.pexels.com/photos/1024311/pexels-photo-1024311.jpeg?auto=compress&cs=tinysrgb&w=400&h=500&fit=crop',
        'explore2.jpg': 'https://images.pexels.com/photos/1933873/pexels-photo-1933873.jpeg?auto=compress&cs=tinysrgb&w=400&h=500&fit=crop',
        'explore3.jpg': 'https://images.pexels.com/photos/1758144/pexels-photo-1758144.jpeg?auto=compress&cs=tinysrgb&w=400&h=500&fit=crop',
        'explore4.jpg': 'https://images.pexels.com/photos/1545743/pexels-photo-1545743.jpeg?auto=compress&cs=tinysrgb&w=400&h=500&fit=crop',
        'explore5.jpg': 'https://images.pexels.com/photos/1906658/pexels-photo-1906658.jpeg?auto=compress&cs=tinysrgb&w=400&h=500&fit=crop',
        'explore6.jpg': 'https://images.pexels.com/photos/1457842/pexels-photo-1457842.jpeg?auto=compress&cs=tinysrgb&w=400&h=500&fit=crop',
        'explore7.jpg': 'https://images.pexels.com/photos/1450360/pexels-photo-1450360.jpeg?auto=compress&cs=tinysrgb&w=400&h=500&fit=crop',
        'explore8.jpg': 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=400&h=500&fit=crop',
        
        # 作品图片 (300x300)
        'work1.jpg': 'https://images.pexels.com/photos/1252869/pexels-photo-1252869.jpeg?auto=compress&cs=tinysrgb&w=300&h=300&fit=crop',
        'work2.jpg': 'https://images.pexels.com/photos/1323550/pexels-photo-1323550.jpeg?auto=compress&cs=tinysrgb&w=300&h=300&fit=crop',
        'work3.jpg': 'https://images.pexels.com/photos/1591373/pexels-photo-1591373.jpeg?auto=compress&cs=tinysrgb&w=300&h=300&fit=crop',
        'work4.jpg': 'https://images.pexels.com/photos/1624496/pexels-photo-1624496.jpeg?auto=compress&cs=tinysrgb&w=300&h=300&fit=crop',
        'work5.jpg': 'https://images.pexels.com/photos/1770809/pexels-photo-1770809.jpeg?auto=compress&cs=tinysrgb&w=300&h=300&fit=crop',
        'work6.jpg': 'https://images.pexels.com/photos/1761279/pexels-photo-1761279.jpeg?auto=compress&cs=tinysrgb&w=300&h=300&fit=crop',
        'work7.jpg': 'https://images.pexels.com/photos/1666021/pexels-photo-1666021.jpeg?auto=compress&cs=tinysrgb&w=300&h=300&fit=crop',
        'work8.jpg': 'https://images.pexels.com/photos/1619569/pexels-photo-1619569.jpeg?auto=compress&cs=tinysrgb&w=300&h=300&fit=crop',
        'work9.jpg': 'https://images.pexels.com/photos/1612461/pexels-photo-1612461.jpeg?auto=compress&cs=tinysrgb&w=300&h=300&fit=crop',
        
        # 聊天头像 - 非人物 (200x200)
        'chat1.jpg': 'https://images.pexels.com/photos/1661179/pexels-photo-1661179.jpeg?auto=compress&cs=tinysrgb&w=200&h=200&fit=crop',  # 狗
        'chat2.jpg': 'https://images.pexels.com/photos/1906157/pexels-photo-1906157.jpeg?auto=compress&cs=tinysrgb&w=200&h=200&fit=crop',  # 鸟
        
        # 个人资料图片 - 非人物
        'profile_avatar.jpg': 'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=200&h=200&fit=crop',  # 猫
        'profile_bg.jpg': 'https://images.pexels.com/photos/1287460/pexels-photo-1287460.jpeg?auto=compress&cs=tinysrgb&w=800&h=400&fit=crop',
    }
    
    print(f"\n准备下载 {len(images)} 张图片...\n")
    
    success_count = 0
    fail_count = 0
    
    for filename, url in images.items():
        if download_image(url, filename):
            success_count += 1
        else:
            fail_count += 1
        # 添加延迟以避免请求过快
        time.sleep(0.5)
    
    print("\n" + "=" * 60)
    print(f"✅ 下载完成！")
    print(f"   成功: {success_count} 张")
    print(f"   失败: {fail_count} 张")
    print(f"   图片位置: assets/images/")
    print("\n现在可以运行: flutter run")
    print("或在已运行的应用中按 'r' 进行热重载")
    print("=" * 60)

if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print("\n\n下载已取消")
    except Exception as e:
        print(f"\n错误: {e}")
