# 爱伴 (AiBan) - Flutter 摄影分享App 项目结构

## 项目概述
这是一个基于Flutter开发的摄影分享应用，主打"陪伴式摄影"理念，提供沉浸式的图片浏览和分享体验。

## 技术栈
- Flutter SDK: ^3.5.3
- 状态管理: setState (无第三方状态管理库)
- 本地存储: shared_preferences
- 图片: 本地assets (无网络图片缓存)

## 项目结构

```
lib/
├── main.dart                 # 应用入口
├── models/                   # 数据模型
│   ├── post.dart            # 帖子模型
│   ├── story.dart           # Story模型
│   ├── explore_item.dart    # 探索项模型
│   └── message.dart         # 消息模型
├── screens/                  # 页面
│   ├── main_screen.dart     # 主屏幕(底部导航)
│   ├── home_screen.dart     # 首页(Feed流)
│   ├── explore_screen.dart  # 探索页(瀑布流)
│   ├── message_screen.dart  # 消息页
│   └── profile_screen.dart  # 个人主页
├── widgets/                  # 组件
│   ├── story_item.dart      # Story组件
│   └── post_card.dart       # 帖子卡片组件
├── utils/                    # 工具类
│   └── app_colors.dart      # 颜色常量
└── data/                     # 数据层
    └── mock_data.dart       # 模拟数据

assets/
└── images/                   # 图片资源
    └── README.md            # 图片说明文档
```

## 核心功能

### 1. 首页 (HomeScreen)
- 顶部导航栏: 发现/关注/榜单切换
- Story横向滚动区域
- Feed流帖子展示
- 点赞功能
- 关注按钮

### 2. 探索页 (ExploreScreen)
- 搜索框
- 分类标签切换
- 瀑布流布局
- 分类蒙版展示

### 3. 消息页 (MessageScreen)
- 通知卡片(获赞和收藏、新增关注)
- 消息列表
- 系统通知
- 未读标记

### 4. 个人主页 (ProfileScreen)
- 个人信息展示
- 统计数据(关注/粉丝/获赞)
- 作品/收藏/喜欢标签切换
- 作品网格展示

## 设计规范

### 颜色系统
- 品牌主色: #8E2DE2 (深紫)
- 品牌副色: #F000FF (玫红)
- 品牌渐变: 从深紫到玫红
- 文本主色: #1A1A1A
- 文本副色: #8E8E93
- 背景色: #FFFFFF

### UI特点
- 大圆角设计 (20px+)
- 卡片阴影效果
- 渐变色按钮
- 毛玻璃效果
- 悬浮式底部导航栏

## 如何运行

1. 确保已安装Flutter SDK
2. 克隆项目后运行:
   ```bash
   flutter pub get
   ```

3. 添加图片资源到 `assets/images/` 目录
   - 参考 `assets/images/README.md` 了解需要的图片

4. 运行应用:
   ```bash
   flutter run
   ```

## 图片资源说明

由于项目使用本地图片，需要手动添加以下图片到 `assets/images/` 目录：

### 必需图片列表
- **头像**: avatar1-4.jpg, user1-4.jpg, chat1-2.jpg, profile_avatar.jpg
- **帖子**: post1-4.jpg
- **探索**: explore1-8.jpg
- **作品**: work1-9.jpg
- **背景**: profile_bg.jpg

### 图片尺寸建议
- 头像: 200x200px
- 帖子: 800x1000px (4:5比例)
- 探索: 400x500px
- 作品: 300x300px
- 背景: 800x400px

### 获取图片
可以从以下网站获取免费图片：
- https://unsplash.com
- https://pexels.com
- https://pixabay.com

## 注意事项

1. **无网络图片**: 项目不使用网络图片，所有图片需要本地提供
2. **无账户系统**: 当前版本不包含登录/注册功能
3. **无分享功能**: 不使用 share_plus 包
4. **无外部字体**: 使用系统默认字体
5. **简单状态管理**: 使用 setState，未使用 Provider/Bloc 等

## 开发建议

### 添加新功能
1. 在 `models/` 中定义数据模型
2. 在 `data/mock_data.dart` 中添加模拟数据
3. 在 `screens/` 中创建新页面
4. 在 `widgets/` 中创建可复用组件

### 状态管理
- 使用 `setState` 管理局部状态
- 使用 `shared_preferences` 持久化数据
- 通过回调函数在组件间传递数据

### 样式规范
- 使用 `AppColors` 类中定义的颜色
- 保持一致的圆角和间距
- 使用渐变色突出重要元素

## 未来扩展

可以考虑添加的功能：
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

## 许可证

本项目仅供学习和参考使用。
