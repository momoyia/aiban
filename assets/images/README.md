# 图片资源说明

本应用的所有图片资源均来自 [Pexels](https://www.pexels.com/)，一个提供免费高质量图片的网站。

## 图片列表

### 头像图片 (Avatar) - 200x200px
- avatar1.jpg - avatar4.jpg (Story头像)
- user1.jpg - user4.jpg (用户头像)
- chat1.jpg - chat2.jpg (聊天头像)
- profile_avatar.jpg (个人资料头像)

### 帖子图片 (Posts) - 800x1000px (4:5比例)
- post1.jpg - post4.jpg (Feed流帖子图片)

### 探索页图片 (Explore) - 400x500px
- explore1.jpg - explore8.jpg (探索页瀑布流图片)

### 作品图片 (Works) - 300x300px
- work1.jpg - work9.jpg (个人作品集图片)

### 其他
- profile_bg.jpg (个人资料背景图) - 800x400px

## 如何更新图片

### 方法1: 使用自动下载脚本（推荐）

在项目根目录运行：
```bash
python3 download_pexels_images.py
```

此脚本会自动从 Pexels 下载所有需要的图片。

### 方法2: 手动下载

1. 访问 https://www.pexels.com
2. 搜索你喜欢的图片类型（人像、风景、建筑等）
3. 下载图片并重命名为对应的文件名
4. 放置到 `assets/images/` 目录

### 方法3: 使用占位图片

如果只是测试，可以使用占位图片：
```bash
python3 generate_placeholder_images.py
```

## 图片版权

所有图片来自 Pexels，遵循 [Pexels License](https://www.pexels.com/license/)：
- ✅ 可以免费用于个人和商业用途
- ✅ 无需署名（但建议署名）
- ✅ 可以修改图片
- ❌ 不能直接出售未修改的图片
- ❌ 不能在其他图片网站上分发

## 感谢

感谢 Pexels 和所有摄影师提供的优质免费图片资源！
