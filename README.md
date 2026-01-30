# 爱伴 (AiBan) - 摄影分享App

一个基于Flutter开发的摄影分享应用，主打"陪伴式摄影"理念，提供沉浸式的图片浏览和分享体验。

## ✨ 特性

- 🎨 **精美UI设计** - 品牌渐变色、大圆角、毛玻璃效果
- 📱 **四大核心页面** - 首页Feed流、探索瀑布流、消息中心、个人主页
- 💜 **品牌色系** - 深紫(#8E2DE2)到玫红(#F000FF)的渐变设计
- 🖼️ **沉浸体验** - 大图展示、悬浮卡片、优雅动画
- 📦 **轻量级** - 无复杂依赖，仅使用shared_preferences
- 🎯 **简洁代码** - 使用setState状态管理，易于理解和维护

## 🚀 快速开始

### 1. 安装依赖

```bash
flutter pub get
```

### 2. 生成占位图片

选择以下任一方法：

**方法A: 从Pexels下载真实图片（推荐）**
```bash
python3 download_pexels_images.py
```

**方法B: 使用Python生成占位图片**
```bash
pip install Pillow
python3 generate_placeholder_images.py
```

**方法C: 使用Shell脚本（需要ImageMagick）**
```bash
brew install imagemagick  # macOS
./generate_placeholder_images.sh
```

**方法D: 手动下载图片**
- 从 [Pexels](https://www.pexels.com) 下载图片
- 参考 `assets/images/README.md` 了解需要的图片列表

### 3. 运行应用

```bash
flutter run
```

## 📱 功能展示

### 首页 (Home)
- Story横向滚动展示
- Feed流大图卡片
- 点赞、评论、分享功能
- 关注按钮

### 探索 (Explore)
- 搜索框
- 分类标签切换
- 瀑布流布局
- 分类蒙版展示

### 消息 (Message)
- 获赞和收藏通知
- 新增关注通知
- 私信列表
- 未读标记

### 我的 (Profile)
- 个人信息展示
- 关注/粉丝/获赞统计
- 作品网格展示
- 编辑资料按钮

## 🎨 设计规范

### 色彩体系
- **品牌主色**: #8E2DE2 (深紫)
- **品牌副色**: #F000FF (玫红)
- **品牌渐变**: 从深紫到玫红
- **文本主色**: #1A1A1A
- **文本副色**: #8E8E93
- **背景色**: #FFFFFF

### UI特点
- 大圆角设计 (20px+)
- 卡片阴影效果
- 渐变色按钮
- 悬浮式底部导航栏
- 8pt栅格系统

## 📂 项目结构

```
lib/
├── main.dart                 # 应用入口
├── models/                   # 数据模型
│   ├── post.dart
│   ├── story.dart
│   ├── explore_item.dart
│   └── message.dart
├── screens/                  # 页面
│   ├── main_screen.dart
│   ├── home_screen.dart
│   ├── explore_screen.dart
│   ├── message_screen.dart
│   └── profile_screen.dart
├── widgets/                  # 组件
│   ├── story_item.dart
│   └── post_card.dart
├── utils/                    # 工具类
│   └── app_colors.dart
└── data/                     # 数据层
    └── mock_data.dart
```

## 🛠️ 技术栈

- **Flutter SDK**: ^3.5.3
- **状态管理**: setState
- **本地存储**: shared_preferences
- **图片**: 本地assets

## 📖 文档

- [设计文档](README_DESIGN.md) - 产品设计理念和UI规范
- [项目结构详解](PROJECT_STRUCTURE.md)
- [快速启动指南](QUICK_START.md)
- [图片资源说明](assets/images/README.md)

## 🔧 开发

### 热重载
```bash
# 运行应用后
r  # 热重载
R  # 热重启
q  # 退出
```

### 代码检查
```bash
flutter analyze
```

### 构建发布版本
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## 📝 注意事项

1. ✅ 使用本地图片（assets）
2. ✅ 使用setState状态管理
3. ✅ 使用shared_preferences存储
4. ❌ 不使用freezed包
5. ❌ 不使用part语法
6. ❌ 不使用cached_network_image
7. ❌ 不使用share_plus
8. ❌ 不包含账户功能
9. ❌ 不使用外部字体

## 🎯 未来扩展

- [ ] 用户认证系统
- [ ] 网络图片加载
- [ ] 评论功能
- [ ] 搜索功能
- [ ] 图片上传
- [ ] 个人资料编辑
- [ ] 关注/取消关注
- [ ] 收藏功能
- [ ] 分享功能
- [ ] 推送通知

## 📄 许可证

本项目仅供学习和参考使用。

### 图片版权
所有图片资源来自 [Pexels](https://www.pexels.com/)，遵循 Pexels License，可免费用于个人和商业用途。

## 🙏 致谢

- 感谢 [Pexels](https://www.pexels.com/) 提供的免费高质量图片资源
- 感谢所有 Pexels 摄影师的精彩作品

## 🤝 贡献

欢迎提交Issue和Pull Request！

## 📧 联系

如有问题，请提交Issue。

---

Made with ❤️ using Flutter
# aiban
