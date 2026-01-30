# 快速启动指南

## 第一步：安装依赖

```bash
flutter pub get
```

## 第二步：准备图片资源

### 方法1：使用占位图片（快速测试）

创建一个简单的脚本来生成占位图片，或者使用在线服务：

```bash
# 使用 ImageMagick 创建占位图片（如果已安装）
cd assets/images

# 创建头像
for i in {1..4}; do
  convert -size 200x200 xc:lightblue -pointsize 60 -draw "text 70,120 'A$i'" avatar$i.jpg
done

# 创建用户头像
for i in {1..4}; do
  convert -size 200x200 xc:lightgreen -pointsize 60 -draw "text 70,120 'U$i'" user$i.jpg
done

# 创建帖子图片
for i in {1..4}; do
  convert -size 800x1000 xc:lightcoral -pointsize 100 -draw "text 300,500 'P$i'" post$i.jpg
done

# 创建探索图片
for i in {1..8}; do
  convert -size 400x500 xc:lightyellow -pointsize 80 -draw "text 150,250 'E$i'" explore$i.jpg
done

# 创建作品图片
for i in {1..9}; do
  convert -size 300x300 xc:lightpink -pointsize 60 -draw "text 120,170 'W$i'" work$i.jpg
done

# 创建聊天头像
for i in {1..2}; do
  convert -size 200x200 xc:lightcyan -pointsize 60 -draw "text 70,120 'C$i'" chat$i.jpg
done

# 创建个人资料图片
convert -size 200x200 xc:lavender -pointsize 50 -draw "text 50,120 'Profile'" profile_avatar.jpg
convert -size 800x400 xc:lightsteelblue -pointsize 80 -draw "text 250,220 'Background'" profile_bg.jpg
```

### 方法2：从Unsplash下载（推荐）

访问 https://unsplash.com 并下载以下类型的图片：

1. **头像图片** (搜索 "portrait" 或 "face")
   - 下载12张，重命名为：
   - avatar1.jpg - avatar4.jpg
   - user1.jpg - user4.jpg
   - chat1.jpg - chat2.jpg
   - profile_avatar.jpg
   - profile_bg.jpg

2. **帖子图片** (搜索 "landscape" 或 "nature")
   - 下载4张，重命名为 post1.jpg - post4.jpg

3. **探索图片** (搜索 "photography")
   - 下载8张，重命名为 explore1.jpg - explore8.jpg

4. **作品图片** (搜索 "art" 或 "creative")
   - 下载9张，重命名为 work1.jpg - work9.jpg

### 方法3：使用在线占位图服务

修改 `lib/data/mock_data.dart` 中的图片路径，使用在线占位图：

```dart
// 例如使用 picsum.photos
image: 'https://picsum.photos/800/1000?random=1',
```

但注意：这需要修改代码以支持网络图片。

## 第三步：运行应用

```bash
# 查看可用设备
flutter devices

# 在特定设备上运行
flutter run -d <device_id>

# 或直接运行（会自动选择设备）
flutter run
```

## 第四步：热重载测试

应用运行后，你可以：
- 按 `r` 进行热重载
- 按 `R` 进行热重启
- 按 `q` 退出

## 常见问题

### Q: 图片不显示怎么办？
A: 确保：
1. 图片文件存在于 `assets/images/` 目录
2. 文件名与代码中的名称完全匹配（包括大小写）
3. 已运行 `flutter pub get`
4. 已重启应用（不是热重载）

### Q: 如何在iOS模拟器上运行？
A: 
```bash
# 打开iOS模拟器
open -a Simulator

# 运行应用
flutter run
```

### Q: 如何在Android模拟器上运行？
A:
```bash
# 启动Android模拟器（在Android Studio中）
# 或使用命令行
emulator -avd <avd_name>

# 运行应用
flutter run
```

### Q: 如何构建发布版本？
A:
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## 测试不同屏幕

应用已针对以下屏幕尺寸优化：
- iPhone 14/15 (390x844)
- iPhone 14/15 Pro Max (430x932)
- Android 中等屏幕 (360x800)
- Android 大屏幕 (412x915)

## 性能优化建议

1. **图片优化**：
   - 压缩图片以减小应用体积
   - 使用适当的分辨率

2. **构建优化**：
   ```bash
   flutter build apk --release --split-per-abi
   ```

3. **分析性能**：
   ```bash
   flutter run --profile
   ```

## 下一步

- 查看 `PROJECT_STRUCTURE.md` 了解项目结构
- 查看 `README.md` 了解设计理念
- 开始自定义和扩展功能！

## 需要帮助？

- Flutter文档: https://flutter.dev/docs
- Flutter中文网: https://flutter.cn
- Dart文档: https://dart.dev/guides
